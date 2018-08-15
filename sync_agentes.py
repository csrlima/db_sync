import logging
import json
import os
import requests
from sqlalchemy import create_engine, MetaData, Table, select, update
# from settings import UR_DB_HOST, UR_DB_NAME, UR_DB_USER, UR_DB_PASSWORD, UR_FACES_DIR, UR_UNKNOWN_DIR, UR_SHOTS_DIR, UR_TOLERANCE

class Sync_agentes():
    def __init__(self, *args, **kwargs):
        self.logger = logging.getLogger(__name__)
        self.logger.setLevel(logging.DEBUG)
        handler = logging.FileHandler(os.getenv("HOME") + '/sync_log_urecognition_service.txt')
        handler.setLevel(logging.INFO)
        formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
        handler.setFormatter(formatter)
        self.logger.addHandler(handler)
        self._id_agente = 'ursv0001'
    _db_connection = 'mysql+pymysql://{0}:{1}@{2}/{3}?charset=utf8mb4'.format('root','14az20yzotac','127.0.0.1','db_piramide')
    _api_url = "http://xmpp.radiomarketbeat.com/api/"

    def _get_serv_agente(self):
        try:
            data = requests.post(self._api_url + 'urecognition_services/get_agente',
                {'id_agente': self._id_agente}, auth=('mbeat', '14az20ymbeatserv'))
        except Exception as e:
            self.logger.error("Error al obtener el service _get_data_agentes: {0}".format(e))
            return False
        if data.status_code == requests.codes.ok:
            if 'success' in data.json()['status']:
                item = data.json()['data']
                return item
            else:
                self.logger.error("Resultado inesperado de service _get_data_agentes: {0}".format(data.text))
                return False
        else:
            self.logger.error("Codigo de error de service _get_data_agentes: {0}".format(data.status_code))
            return False

    def _get_local_agente(self):
        try:
            engine = create_engine(self._db_connection)
            metadata = MetaData()
            connection = engine.connect()
        except Exception as e:
            self.logger.error("No se pudo conectar a la base de datos _get_local_agente: {0}".format(e))
            return False
        dbur_agentes = Table('dbur_agentes', metadata, autoload=True, autoload_with=engine)
        stmt = select([dbur_agentes])
        result = connection.execute(stmt).fetchall()
        return result

    def _insert(self, item):
        try:
            engine = create_engine(self._db_connection)
            metadata = MetaData()
            connection = engine.connect()
        except Exception as e:
            self.logger.error("No se pudo conectar a la base de datos _insert: {0}".format(e))
            return False
        try:
            dbur_agentes = Table('dbur_agentes', metadata, autoload=True, autoload_with=engine)
            statement = dbur_agentes.insert().values(
                    id_agente=item['id_agente'],
                    nombre_agente=item['nombre_agente'],
                    desc_agente=item['desc_agente'],
                    id_restaurante='a9cbbbb4-798d-493d-98b6-b8587ec49d6a'
                )
        except Exception as e:
            self.logger.error("No se pudo preparar el statement query _insert: {0}".format(e))
            return False
        result = connection.execute(statement)
        if result:
            self.logger.info("Elemento insertado: {0}".format(item['id_agente']))
            return True, item['id_restaurante']
        else:
            self.logger.error("No se pudo insertar: {0}".format(item['id_agente']))
            return False

    def _delete(self, id):
        try:
            engine = create_engine(self._db_connection)
            metadata = MetaData()
            connection = engine.connect()
        except Exception as e:
            self.logger.error("No se pudo conectar a la base de datos _delete: {0}".format(e))
            return False
        try:
            dbur_agentes = Table('dbur_agentes', metadata, autoload=True, autoload_with=engine)
            statement = dbur_agentes.delete().where(dbur_agentes.columns.id_agente==id)
        except Exception as e:
            self.logger.error("No se pudo preparar el statement query _delete: {0}".format(e))
            return False
        result = connection.execute(statement)
        if result:
            self.logger.info("Elemento eliminado _delete: {0}".format(id))
            return True
        else:
            self.logger.error("No se pudo eliminar _delete: {0}".format(id))
            return False

    def _get_local_agente(self):
        try:
            engine = create_engine(self._db_connection)
            metadata = MetaData()
            connection = engine.connect()
        except Exception as e:
            self.logger.error("No se pudo conectar a la base de datos _get_local_agente: {0}".format(e))
            return False
        dbur_agentes = Table('dbur_agentes', metadata, autoload=True, autoload_with=engine)
        stmt = select([dbur_agentes])
        result = connection.execute(stmt).fetchall()
        return result

    def _row_compare(self, dict_local, dict_serv, id):
        try:
            dict_local = dict(dict_local)
            dict_local_keys = set(dict_local.keys())
            dict_serv_keys = set(dict_serv.keys())
            intersect_keys = dict_local_keys.intersection(dict_serv_keys)
            modified = {o : (dict_serv[o], dict_local[o]) for o in intersect_keys if dict_local[o] != dict_serv[o]}
            if len(modified) > 0:
                return dict_local[id]
            else:
                return "iguales"
        except Exception as e:
            self.logger.error("No se pudo comparar la fila _row_compare: id {0} except: {1}".format(id, e))
            return False

    def _search_elements(self, dict_local, dict_serv):
        try:
            list_remove = list(set(dict_local) - set(dict_serv))
            list_add = list(set(dict_serv) - set(dict_local))
            self.logger.info("Elementos nuevos: {0}, elementos a eliminar {1}".format(len(list_add), len(list_remove)))
            return list_add, list_remove
        except Exception as e:
            self.logger.error("No se pudo buscar entre los elementos _search_elements: {0}".format(e))
            return False

    def _resolve_add_remove(self):
        service_item = self._get_serv_agente()
        service_item_id = []
        local_items = []
        service_item_id.append(service_item['id_agente'])

        for item in self._get_local_agente():
            local_items.append(item['id_agente'])

        list_add, list_remove = self._search_elements(local_items, service_item_id)
        for item_list_add in list_add:
            if item_list_add == service_item['id_agente']:
                _, id_restaurante = self._insert(service_item)
        for item_list_remove in list_remove:
            _ = self._delete(item_list_remove)

    def _resolve_updates(self):
        service_item = self._get_serv_agente()
        local_items = self._get_local_agente()
        for item in local_items:
            modified = self._row_compare(item, service_item, 'id_agente')
            print("modified: {0}").format(modified)

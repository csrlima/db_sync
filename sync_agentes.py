import json
import requests
from sqlalchemy import Table, select, update
from utils import Utils

class Sync():
    def __init__(self, *args, **kwargs):
        self._id_agente = 'ursv0001'
        self.utils = Utils()
        self.logger = self.utils._logger_init()
        self._engine, self._metadata, self._connection = self.utils._db_init()
        self._service_item = self._get_service_data()
        self._local_items = self._get_local_data()

    _api_url = "http://xmpp.radiomarketbeat.com/api/"

    def _get_service_data(self):
        try:
            data = requests.post(self._api_url + 'urecognition_services/get_agente',
                {'id_agente': self._id_agente}, auth=('mbeat', '14az20ymbeatserv'))
        except Exception as e:
            self.logger.error("Error al obtener el service _get_service_data: {0}".format(e))
            return False
        if data.status_code == requests.codes.ok:
            if 'success' in data.json()['status']:
                item = data.json()['data']
                return item
            else:
                self.logger.error("Resultado inesperado de service _get_service_data: {0}".format(data.text))
                return False
        else:
            self.logger.error("Codigo de error de service _get_service_data: {0}".format(data.status_code))
            return False

    def _get_local_data(self):
        try:
            dbur_agentes = Table('dbur_agentes', self._metadata, autoload=True, autoload_with=self._engine)
            statement = select([dbur_agentes])
            result = self._connection.execute(statement).fetchall()
            return result
        except Exception as e:
            self.logger.error("No se pudo preparar el statement query _get_local_data: {0}".format(e))
            return False

    def _insert(self, item):
        try:
            dbur_agentes = Table('dbur_agentes', self._metadata, autoload=True, autoload_with=self._engine)
            statement = dbur_agentes.insert().values(
                    id_agente=item['id_agente'],
                    nombre_agente=item['nombre_agente'],
                    desc_agente=item['desc_agente'],
                    id_restaurante='a9cbbbb4-798d-493d-98b6-b8587ec49d6a'
                )
        except Exception as e:
            self.logger.error("No se pudo preparar el statement query _insert: {0}".format(e))
            return False
        result = self._connection.execute(statement)
        if result:
            self.logger.info("Elemento insertado: {0}".format(item['id_agente']))
            return True, item['id_restaurante']
        else:
            self.logger.error("No se pudo insertar: {0}".format(item['id_agente']))
            return False

    def _delete(self, id):
        try:
            dbur_agentes = Table('dbur_agentes', self._metadata, autoload=True, autoload_with=self._engine)
            statement = dbur_agentes.delete().where(dbur_agentes.columns.id_agente==id)
        except Exception as e:
            self.logger.error("No se pudo preparar el statement query _delete: {0}".format(e))
            return False
        result = self._connection.execute(statement)
        if result:
            self.logger.info("Elemento eliminado _delete: {0}".format(id))
            return True
        else:
            self.logger.error("No se pudo eliminar _delete: {0}".format(id))
            return False

    def _update(self, item):
        try:
            dbur_agentes = Table('dbur_agentes', self._metadata, autoload=True, autoload_with=self._engine)
            statement = update(dbur_agentes).values(
                    nombre_agente=item['nombre_agente'],
                    desc_agente=item['desc_agente'],
                    id_restaurante='a9cbbbb4-798d-493d-98b6-b8587ec49d6a'
                ).where(dbur_agentes.columns.id_agente==item['id_agente'])
        except Exception as e:
            self.logger.error("No se pudo preparar el statement query _insert: {0}".format(e))
            return False
        result = self._connection.execute(statement)
        if result:
            self.logger.info("Elemento actualizado: {0}".format(item['id_agente']))
            return True
        else:
            self.logger.error("No se pudo actualizar: {0}".format(item['id_agente']))
            return False

    def _get_local_agente(self):
        dbur_agentes = Table('dbur_agentes', self._metadata, autoload=True, autoload_with=self._engine)
        stmt = select([dbur_agentes])
        result = self._connection.execute(stmt).fetchall()
        return result

    def _resolve_add_remove(self):
        service_item_id = []
        self._local_items = []
        service_item_id.append(self._service_item['id_agente'])

        for item in self._get_local_agente():
            self._local_items.append(item['id_agente'])

        list_add, list_remove = self.utils._search_elements(self._local_items, service_item_id)
        for item_list_add in list_add:
            if item_list_add == self._service_item['id_agente']:
                _, id_restaurante = self._insert(self._service_item)
        for item_list_remove in list_remove:
            _ = self._delete(item_list_remove)

    def _resolve_updates(self):
        for item in self._local_items:
            id_update = self.utils._row_compare(item, self._service_item, 'id_agente')
            if id_update == self._service_item['id_agente']:
                self._update(self._service_item)

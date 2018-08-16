import json
import requests
from sqlalchemy import Table, select, update
from utils import Utils

class Sync():
    def __init__(self, logger, id_agente):
        self._id_agente = id_agente
        self.logger = logger
        self.utils = Utils(logger)
        self._engine, self._metadata, self._connection = self.utils._db_init()
        self._service_item = self._get_service_data()
        self._local_items = self._get_local_data()

    _api_url = "http://xmpp.radiomarketbeat.com/api/"

    def _get_service_data(self):
        try:
            data = requests.post(self._api_url + 'urecognition_services/get_cliente',
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
            tabla = Table('dbur_clientes_marcas', self._metadata, autoload=True, autoload_with=self._engine)
            statement = select([tabla])
            result = self._connection.execute(statement).fetchall()
            return result
        except Exception as e:
            self.logger.error("No se pudo preparar el statement query _get_local_data: {0}".format(e))
            return False

    def _insert(self, item):
        try:
            id = item['id_cliente']
            tabla = Table('dbur_clientes_marcas', self._metadata, autoload=True, autoload_with=self._engine)
            statement = tabla.insert().values(
                    id_cliente = id,
                    nombre_cliente = item['nombre_cliente'],
                    correo = item['correo'],
                    telefono = item['telefono'],
                    fecha_creacion_cliente = item['fecha_creacion_cliente'],
                    id_usuario = item['id_usuario']
                )
        except Exception as e:
            self.logger.error("No se pudo preparar el statement query _insert: {0}".format(e))
            return False
        result = self._connection.execute(statement)
        if result:
            self.logger.info("Elemento insertado: {0}".format(id))
            return True
        else:
            self.logger.error("No se pudo insertar: {0}".format(id))
            return False

    def _delete(self, id):
        try:
            tabla = Table('dbur_clientes_marcas', self._metadata, autoload=True, autoload_with=self._engine)
            statement = tabla.delete().where(tabla.columns.id_cliente == id)
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
            id = item['id_cliente']
            table = Table('dbur_clientes_marcas', self._metadata, autoload=True, autoload_with=self._engine)
            statement = update(table).values(
                    nombre_cliente = item['nombre_cliente'],
                    correo = item['correo'],
                    telefono = item['telefono'],
                    fecha_creacion_cliente = item['fecha_creacion_cliente'],
                    id_usuario = item['id_usuario']
                ).where(table.columns.id_cliente == id)
        except Exception as e:
            self.logger.error("No se pudo preparar el statement query _insert: {0}".format(e))
            return False
        result = self._connection.execute(statement)
        if result:
            self.logger.info("Elemento actualizado: {0}".format(id))
            return True
        else:
            self.logger.error("No se pudo actualizar: {0}".format(id))
            return False

    def _get_local_data(self):
        tabla = Table('dbur_agentes', self._metadata, autoload=True, autoload_with=self._engine)
        stmt = select([tabla])
        result = self._connection.execute(stmt).fetchall()
        return result

    def _resolve_add_remove(self):
        # id comun de las tablas para buscar agregados y eliminados
        id = 'id_cliente'
        service_item_id = []
        self._local_items = []
        service_item_id.append(self._service_item[id])

        for item in self._get_local_data():
            self._local_items.append(str(item[id]))

        list_add, list_remove = self.utils._search_elements(self._local_items, service_item_id)
        for item_list_add in list_add:
            if item_list_add == self._service_item[id]:
                _, id_restaurante = self._insert(self._service_item)
        for item_list_remove in list_remove:
            self._delete(item_list_remove)

    def _resolve_updates(self):
        # id comun de las tablas para procesar comparacion
        id = 'id_cliente'
        for item in self._local_items:
            id_update = self.utils._row_compare(item, self._service_item, id)
            if str(id_update) == str(self._service_item[id]):
                self._update(self._service_item)

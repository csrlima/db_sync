import json
import requests
import inspect
from sqlalchemy import Table, select, update
from utils import Utils

class Sync():
    def __init__(self, logger):
        self.logger = logger
        self.utils = Utils(logger)
        self._api_url = self.utils._get_api_url()
        self._engine, self._metadata, self._connection = self.utils._db_init()
        self._service_items = self._get_service_data()
        self._local_items = self._get_local_data()

    _table_name = 'dbur_categorias_personas'
    _table_pk_name = 'id_categoria'

    def _get_service_data(self):
        try:
            data = requests.post(self._api_url + 'urecognition_services/get_categorias_personas',
                {}, auth=('mbeat', '14az20ymbeatserv'))
        except Exception as e:
            self.logger.error("{0}. Error al obtener el service: {1}".format(inspect.stack()[0][3], e))
            return False
        if data.status_code == requests.codes.ok:
            if 'success' in data.json()['status']:
                item = data.json()['data']
                return item
            else:
                self.logger.error("{0}. Resultado inesperado de service: {1}".format(inspect.stack()[0][3], data.text))
                return False
        else:
            self.logger.error("{0}. Codigo de error de service: {1}".format(inspect.stack()[0][3], data.status_code))
            return False

    def _get_local_data(self):
        try:
            tabla = Table(self._table_name, self._metadata, autoload=True, autoload_with=self._engine)
            statement = select([tabla])
            result = self._connection.execute(statement).fetchall()
            return result
        except Exception as e:
            self.logger.error("{0}. No se pudo preparar el statement query: {1}".format(inspect.stack()[0][3], e))
            return False

    def _insert(self, item):
        try:
            id = item[self._table_pk_name]
            tabla = Table(self._table_name, self._metadata, autoload=True, autoload_with=self._engine)
            statement = tabla.insert().values(
                    id_categoria = id,
                    nombre_categoria = item['nombre_categoria']
                )
        except Exception as e:
            self.logger.error("{0}. No se pudo preparar el statement query: {1}".format(inspect.stack()[0][3], e))
            return False
        result = self._connection.execute(statement)
        if result:
            self.logger.info("{0}. Elemento insertado: {1}".format(inspect.stack()[0][3], id))
            return True
        else:
            self.logger.error("{0}. No se pudo insertar: {1}".format(inspect.stack()[0][3], id))
            return False

    def _delete(self, id):
        try:
            tabla = Table(self._table_name, self._metadata, autoload=True, autoload_with=self._engine)
            statement = tabla.delete().where(tabla.columns.id_categoria == id)
        except Exception as e:
            self.logger.error("{0}. No se pudo preparar el statement: {1}".format(inspect.stack()[0][3], e))
            return False
        result = self._connection.execute(statement)
        if result:
            self.logger.info("{0}. Elemento eliminado id: {1}".format(inspect.stack()[0][3], id))
            return True
        else:
            self.logger.error("{0}. No se pudo eliminar id: {1}".format(inspect.stack()[0][3], id))
            return False

    def _update(self, item):
        try:
            id = item[self._table_pk_name]
            tabla = Table(self._table_name, self._metadata, autoload=True, autoload_with=self._engine)
            statement = update(tabla).values(
                    nombre_categoria = item['nombre_categoria']
                ).where(tabla.columns.id_categoria == id)
        except Exception as e:
            self.logger.error("{0}. No se pudo preparar el statement: {1}".format(inspect.stack()[0][3], e))
            return False
        result = self._connection.execute(statement)
        if result:
            self.logger.info("{0}. Elemento actualizado: {1}".format(inspect.stack()[0][3], id))
            return True
        else:
            self.logger.error("{0}. No se pudo actualizar: {1}".format(inspect.stack()[0][3], id))
            return False

    def _resolve_add_remove(self):
        insert_items, delete_items = self.utils._ident_add_remove(self._local_items, self._service_items, self._table_pk_name)
        for item in insert_items:
            self._insert(item)
        for item in delete_items:
            self._delete(item)

    def _resolve_updates(self):
        update_items = self.utils._ident_updates(self._local_items, self._service_items, self._table_pk_name)
        for item in update_items:
            self._update(item)

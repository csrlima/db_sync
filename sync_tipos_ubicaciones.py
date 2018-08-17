import json
import requests
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

    _table_name = 'dbur_tipos_ubicaciones'
    _table_pk_name = 'id_tipo_ubicacion'

    def _get_service_data(self):
        try:
            data = requests.post(self._api_url + 'urecognition_services/get_tipos_ubicaciones',
                {}, auth=('mbeat', '14az20ymbeatserv'))
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
            print(self._table_name)
            tabla = Table(self._table_name, self._metadata, autoload=True, autoload_with=self._engine)
            statement = select([tabla])
            result = self._connection.execute(statement).fetchall()
            return result
        except Exception as e:
            self.logger.error("No se pudo preparar el statement query _get_local_data: {0}".format(e))
            return False

    def _insert(self, item):
        try:
            id = item[self._table_pk_name]
            tabla = Table(self._table_name, self._metadata, autoload=True, autoload_with=self._engine)
            statement = tabla.insert().values(
                    id_tipo_ubicacion = id,
                    nombre_tipo = item['nombre_tipo']
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
            tabla = Table(self._table_name, self._metadata, autoload=True, autoload_with=self._engine)
            statement = tabla.delete().where(tabla.columns.id_tipo_ubicacion == id)
        except Exception as e:
            self.logger.error("No se pudo preparar el statement query _delete: {0}".format(e))
            return False
        result = self._connection.execute(statement)
        if result:
            self.logger.info("Elemento eliminado id: {0}".format(id))
            return True
        else:
            self.logger.error("No se pudo eliminar id: {0}".format(id))
            return False

    def _update(self, item):
        try:
            id = item[self._table_pk_name]
            tabla = Table(self._table_name, self._metadata, autoload=True, autoload_with=self._engine)
            statement = update(tabla).values(
                    nombre_tipo = item['nombre_tipo']
                ).where(tabla.columns.id_tipo_ubicacion == id)
        except Exception as e:
            self.logger.error("No se pudo preparar el statement query _update: {0}".format(e))
            return False
        result = self._connection.execute(statement)
        if result:
            self.logger.info("Elemento actualizado: {0}".format(id))
            return True
        else:
            self.logger.error("No se pudo actualizar: {0}".format(id))
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

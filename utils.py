import json
from sqlalchemy import create_engine, MetaData
# from settings import UR_DB_HOST, UR_DB_NAME, UR_DB_USER, UR_DB_PASSWORD, UR_FACES_DIR, UR_UNKNOWN_DIR, UR_SHOTS_DIR, UR_TOLERANCE

class Utils():
    def __init__(self, logger):
        self.logger = logger

    _db_connection = 'mysql+pymysql://{0}:{1}@{2}/{3}?charset=utf8mb4'.format('root','14az20yzotac','127.0.0.1','db_piramide')

    def _get_api_url(self):
        return "http://xmpp.radiomarketbeat.com/api/"

    def _db_init(self):
        try:
            engine = create_engine(self._db_connection)
            metadata = MetaData()
            connection = engine.connect()
            return engine, metadata, connection
        except Exception as e:
            self.logger.error("No se pudo conectar a la base de datos _db_init: {0}".format(e))
            quit()

    def _row_compare(self, dict_local, dict_serv, id):
        try:
            dict_local = dict(dict_local)
            dict_local_keys = set(dict_local.keys())
            dict_serv_keys = set(dict_serv.keys())
            intersect_keys = dict_local_keys.intersection(dict_serv_keys)
            modified = {o : (dict_serv[o], dict_local[o]) for o in intersect_keys if str(dict_local[o]) != str(dict_serv[o])}
            if len(modified) > 0:
                return dict_local[id]
            else:
                self.logger.info("Elementos iguales _row_compare: id {0}".format(dict_local[id]))
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

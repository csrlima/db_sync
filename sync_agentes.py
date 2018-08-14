import logging
import json
import mysql.connector as db
# from settings import UR_DB_HOST, UR_DB_NAME, UR_DB_USER, UR_DB_PASSWORD, UR_FACES_DIR, UR_UNKNOWN_DIR, UR_SHOTS_DIR, UR_TOLERANCE

class Sync_agentes():
    def __init__(self, *args, **kwargs):
        self.logger = logging.getLogger(__name__)
        # self.logger.setLevel(logging.DEBUG)
        # handler = logging.FileHandler(os.getenv("HOME") + '/sync_log_urecognition_service.txt')
        # handler.setLevel(logging.INFO)
        # formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
        # handler.setFormatter(formatter)
        # self.logger.addHandler(handler)

    UR_DB_USER = 'root'
    UR_DB_PASSWORD = '14az20yzotac'
    UR_DB_HOST = '127.0.0.1'
    UR_DB_NAME = 'db_piramide'
    _config_db = {'user': UR_DB_USER, 'password': UR_DB_PASSWORD, 'host': UR_DB_HOST, 'database': UR_DB_NAME}

    def _get_data_agentes(self):
        try:
            print("Correcto get data")
        except Exception as e:
            print("Error get data")
            self.logger.error("Error en _get_data_agentes: " + str(e))

    # def _get_data_agentes(self):
    #     try:
    #         cn = db.connect(**self._config_db)
    #         try:
    #             cur = cn.cursor()
    #             cur.execute("""INSERT INTO dbur_identificados
    #                 (id_identificacion, id_persona, foto_match_stream, foto_match_saved, match_error,
    #                 fh_identificacion, id_agente, id_local_ubicacion)
    #                 VALUES (%s,%s,%s,%s,%s,%s,%s,%s)""",
    #                 (str(uuid.uuid4()),
    #                 id_persona,
    #                 stream_face,
    #                 saved_face,
    #                 match_error,
    #                 time.strftime("%Y-%m-%d %H:%M:%S"),
    #                 self._id_agente,
    #                 0))
    #             cn.commit()
    #             cn.close()
    #             self.logger.info("Identificado : " + str(id_persona) + " -- " + str(saved_face) + " - " + str(match_error))
    #         except Exception as e:
    #             self.logger.error("No se pudo obtener datos _match_save: " + str(e))
    #             quit()
    #         finally:
    #             cn.close()
    #     except Exception as e:
    #         self.logger.error("No se pudo conectar a la base de datos _match_save: " + str(e))
    #         quit()

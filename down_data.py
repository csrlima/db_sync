import logging
import os
from utils import Utils
from sync_agentes import Sync as Sync_agentes
from sync_clientes_marcas import Sync as Sync_clientes_marcas
from sync_restaurantes_sucursales import Sync as Sync_restaurantes_sucursales
from sync_tipos_ubicaciones import Sync as Sync_tipos_ubicaciones


def _logger_init():
    logger = logging.getLogger(__name__)
    logger.setLevel(logging.DEBUG)
    handler = logging.FileHandler(os.getenv("HOME") + '/sync_log_urecognition_service.txt')
    handler.setLevel(logging.INFO)
    formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
    handler.setFormatter(formatter)
    logger.addHandler(handler)
    return logger

logger = _logger_init()

# sync de agente
sync_agentes = Sync_agentes(logger)
# sync_agentes._resolve_updates()
# sync_agentes._resolve_add_remove()

# get info de agente local actualizado
agente = dict(sync_agentes._get_local_data()[0])

# # sync de cliente marca
# sync_clientes_marcas = Sync_clientes_marcas(logger, agente['id_agente'])
# sync_clientes_marcas._resolve_updates()
# sync_clientes_marcas._resolve_add_remove()

# sync de restaurantes sucursales
# sync_restaurantes_sucursales = Sync_restaurantes_sucursales(logger, agente['id_agente'])
# sync_restaurantes_sucursales._resolve_updates()
# sync_restaurantes_sucursales._resolve_add_remove()

# sync de tipos de ubicaciones
sync_tipos_ubicaciones = Sync_tipos_ubicaciones(logger)
sync_tipos_ubicaciones._resolve_updates()
sync_tipos_ubicaciones._resolve_add_remove()

import logging
import os
from utils import Utils
from sync_agentes import Sync as Sync_agentes
from sync_clientes_marcas import Sync as Sync_clientes_marcas
from sync_restaurantes_sucursales import Sync as Sync_restaurantes_sucursales
from sync_tipos_ubicaciones import Sync as Sync_tipos_ubicaciones
from sync_local_ubicaciones import Sync as Sync_local_ubicaciones
from sync_categorias_personas import Sync as Sync_categorias_personas
from sync_personas import Sync as Sync_personas
from sync_fotos import Sync as Sync_fotos
from sync_info_personas import Sync as Sync_info_personas


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

logger.info('Iniciando actualizacion de tablas locales')
# sync de agente
logger.info('Actualizacion hacia abajo de dbur_agente')
sync_agentes = Sync_agentes(logger)
sync_agentes._resolve_updates()
sync_agentes._resolve_add_remove()

# get info de agente local actualizado
agente = dict(sync_agentes._get_local_data()[0])

# sync de cliente marca
logger.info('Actualizacion hacia abajo de dbur_cliente_marca')
sync_clientes_marcas = Sync_clientes_marcas(logger, agente['id_agente'])
sync_clientes_marcas._resolve_updates()
sync_clientes_marcas._resolve_add_remove()

# sync de restaurantes sucursales
logger.info('Actualizacion hacia abajo de dbur_restaurantes_sucursales')
sync_restaurantes_sucursales = Sync_restaurantes_sucursales(logger, agente['id_agente'])
sync_restaurantes_sucursales._resolve_updates()
sync_restaurantes_sucursales._resolve_add_remove()

# sync de tipos de ubicaciones
logger.info('Actualizacion hacia abajo de tipos_ubicaciones')
sync_tipos_ubicaciones = Sync_tipos_ubicaciones(logger)
sync_tipos_ubicaciones._resolve_updates()
sync_tipos_ubicaciones._resolve_add_remove()

# sync de local ubicaciones
logger.info('Actualizacion hacia abajo de dbur_local_ubicaciones')
sync_local_ubicaciones = Sync_local_ubicaciones(logger, agente['id_agente'])
sync_local_ubicaciones._resolve_updates()
sync_local_ubicaciones._resolve_add_remove()

# sync de categorias personas
logger.info('Actualizacion hacia abajo de dbur_categorias_personas')
sync_categorias_personas = Sync_categorias_personas(logger)
sync_categorias_personas._resolve_updates()
sync_categorias_personas._resolve_add_remove()

# sync de personas
logger.info('Actualizacion hacia abajo de dbur_personas')
sync_personas = Sync_personas(logger)
sync_personas._resolve_updates()
sync_personas._resolve_add_remove()

# sync de fotos de personas
logger.info('Actualizacion hacia abajo de dbur_fotos')
sync_fotos = Sync_fotos(logger)
sync_fotos._resolve_updates()
sync_fotos._resolve_add_remove()

# get info de agente local actualizado
cliente = dict(sync_clientes_marcas._get_local_data()[0])

# sync de detalle de informacion de persona
logger.info('Actualizacion hacia abajo de dbur_det_info_personas')
sync_info_personas = Sync_info_personas(logger, cliente['id_cliente'])
sync_info_personas._resolve_updates()
sync_info_personas._resolve_add_remove()

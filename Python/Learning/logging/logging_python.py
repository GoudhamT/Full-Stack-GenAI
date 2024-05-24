import logging 
import os

logger_str = "[%(asctime)s : %(module)s : %(levelname)s : %(message)s]"
log_folder = "logs"
log_filename = 'logs/running_log.log'
os.makedirs(log_folder,exist_ok=True)

logging.basicConfig(
        level = logging.INFO,
        format = logger_str,
        handlers = [ logging.FileHandler(log_filename) ] 
)
logger = logging.getLogger("GT")

logger.info("logging is implemented")


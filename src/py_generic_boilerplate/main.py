import logging
import os

from dotenv import load_dotenv

load_dotenv()
log_level = os.getenv('LOG_LEVEL', 'INFO').upper()
logging.basicConfig(format='%(asctime)s - %(message)s', level=getattr(logging, log_level))


def main() -> None:
	logging.info('Hello World!')


if __name__ == '__main__':
	main()

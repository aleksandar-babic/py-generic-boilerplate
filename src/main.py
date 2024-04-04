import logging
import os

from dotenv import load_dotenv

load_dotenv()
logging.basicConfig(format="%(asctime)s - %(message)s", level=logging.INFO)


def main() -> None:
    logging.info(f"Hello World! foo={os.environ.get('FOO')}")


if __name__ == "__main__":
    main()

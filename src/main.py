import logging

from dotenv import load_dotenv

load_dotenv()
logging.basicConfig(format="%(asctime)s - %(message)s", level=logging.INFO)


def main() -> None:
    logging.info("Hello World!")


if __name__ == "__main__":
    main()

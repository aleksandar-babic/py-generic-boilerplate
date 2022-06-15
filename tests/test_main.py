from unittest.mock import patch

from src.main import main


@patch("logging.info")
def test_main_call_logging(mock_logging):
    main()
    mock_logging.assert_called_with("Hello World!")

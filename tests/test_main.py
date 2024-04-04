from unittest.mock import patch

from src.main import main


@patch("logging.info")
def test_main_call_logging(mock_logging, monkeypatch):
    foo_env = "test"
    monkeypatch.setenv("FOO", foo_env)

    main()
    mock_logging.assert_called_with(f"Hello World! foo={foo_env}")

import os

import pytest
from reprohack import enable_logging

TEST_DIR = os.path.dirname(__file__)


@pytest.fixture(scope="session", autouse=True)
def turn_on_logging():
    enable_logging(10)

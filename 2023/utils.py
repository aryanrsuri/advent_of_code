import re
from typing import List


def parselines(filepath: str) -> List[str]:
    with open(filepath, "r") as buffer:
        return buffer.read().splitlines()

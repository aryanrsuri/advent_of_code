import re
from typing import List
from collections import defaultdict


def parselines(filepath: str) -> List[str]:
    with open(filepath, "r") as buffer:
        return buffer.read().splitlines()


def answer(filepath: str):
    lines: List[str] = parselines(filepath)
    result: int = 0
    results = defaultdict(int)
    for current, line in enumerate(lines):
        results[current] += 1
        numbers: List[tuple[str]] = re.compile(
            r":\s*(\d.*)\|\s*(\d.*)").findall(line)
        given = numbers[0][0].split()
        taken = numbers[0][1].split()
        res = [x for x in given if x in taken].__len__()
        if (res > 0):
            result += 2 ** (res - 1)
        for x in range(res):
            results[1+current+x] += results[current]
    return result, sum(results.values())


print(answer("./4.input.txt"))

import generator
import checker

def collectLevels(count):
    eps = 0.0001
    levels = []

    while len(levels) < count:
        level = generator.generate()
        result = checker.check(level)

        percent = result[0] / result[1]

        if percent > eps:
            levels.append((percent, level))
    
    levels.sort()
    levels.reverse()

    return levels
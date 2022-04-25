import generator
import checker
import solver
from group import Group

def collectLevels(count):
    eps = 0.0001
    groups = []

    while len(groups) < count:
        level = generator.generate()
        result = checker.check(level)

        percent = result[0] / result[1]
        
        if percent > eps:
            best_score = solver.bestScore(level)
            groups.append(Group(level, percent, best_score))
    
    groups.sort()
    groups.reverse()

    return groups
import collector
import exporter

count = 5

levels = collector.collectLevels(count)

exporter.export(levels)

# from level import Level
# level = Level(81, -86, ["5", "8", "3", "7"], ["-", "+", "*", "/", "*(-1)"])
# import solver
# solver.bestScore(level)
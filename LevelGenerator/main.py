import collector
import exporter

count = 5

levels = collector.collectLevels(5)

exporter.export(levels)
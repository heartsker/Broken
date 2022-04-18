import collector
import exporter

count = 5

levels = collector.collectLevels(count)

exporter.export(levels)
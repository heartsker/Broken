import json

def export(levels):
    data = {}
    for i in range(len(levels)):
        (percent, level) = levels[i]

        number = i + 1
        start = level.start
        finish = level.finish
        buttons = level.numbers + level.operators

        data[str(number)] = { 'difficulty': percent, 'start': start, 'finish': finish, 'buttons': buttons }
        
    dump = json.dumps(data, indent=4)

    # print(dump)

    with open('levels.json', 'w') as outfile:
        outfile.write(dump)
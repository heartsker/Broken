import json

def export(groups):
    data = {}
    for i in range(len(groups)):
        group = groups[i]

        number = i + 1
        difficulty = group.difficulty
        level = group.level
        start = level.start
        finish = level.finish
        buttons = level.buttons()
        

        data[str(number)] = { 'difficulty': difficulty, 'start': start, 'finish': finish, 'buttons': buttons, 'best_score': group.best_score }
        
    dump = json.dumps(data, indent=4)

    # print(dump)

    with open('LevelGenerator/levels.json', 'w') as outfile:
        outfile.write(dump)
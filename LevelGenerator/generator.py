from enum import Enum
import random

buttonType = {
    'ZERO' : '0',
    'ONE' : '1',
    'TWO' : '2',
    'THREE' : '3',
    'FOUR' : '4',
    'FIVE' : '5',
    'SIX' : '6',
    'SEVEN' : '7',
    'EIGHT' : '8',
    'NINE' : '9',
    'PLUS' : '+',
    'MINUS' : '-',
    'MULTIPLY' : '*',
    'DIVIDE' : '/',
    'POINT' : '.',
    'SIGN' : '*(-1)',
    'OPEN': '(',
    'CLOSE': ')'
}
    

class Level:

    def __init__(self, start, finish, buttons):
        self.start = start
        self.finish = finish
        self.buttons = buttons

    def print(self):
        print('Level:')
        print('\tStart:', self.start)
        print('\tFinish:', self.finish)
        print('\tButtons:', self.buttons)

def generate():
    start = random.randint(-100, 100)
    finish = random.randint(-100, 100)
    count = random.randint(2, len(buttonType) )
    buttons = random.sample(list(buttonType.keys()), count)

    # print(start, finish, count, buttons)
    return Level(start, finish, buttons)
    

# level = generate()
# level.print()

# level = Level(1, 2, ['PLUS', 'ONE'])

def isSign(char):
    return ['+', '-', '*', '/'].count(char)

def check(level):
    iterations = 100000
    max_clicks = 15

    success = 0
    count = 0

    for i in range(iterations):
        line = str(level.start)
        for j in range(max_clicks):
            button = random.choice(level.buttons)

            # print(line)
            if len(line) and isSign(line[-1]) and isSign(buttonType[button]):
                line = line[:-1]

            # print(line)
            
            line += buttonType[button]

            # print(line)

            try:
                result = eval(line)
                # print(result)
            except:
                result = level.finish - 1
                continue


            count += 1
            if result == level.finish:
                success += 1
                break

    return (success, count)

# result = check(level)

# print(result[0], 'out of', result[1], '-', result[0] / result[1])

# Let's find levels!

levels = 0
count = 0

while True:
    level = generate()
    result = check(level)

    if result[0]:
        levels += 1
        print('Level #', levels, sep='')
        level.print()
        print(result[0], 'out of', result[1], '-', result[0] / result[1])
        print('--------------------------------')

    count += 1

    print('--------', levels, 'out of', count, '-----------')

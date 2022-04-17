from enum import Enum
from random import random, randint, choice, choices, sample

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

numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
operators = ['+', '-', '*', '/', '*(-1)', '.']
# brackets = ['(', ')']

class Level:

    def __init__(self, start, finish, numbers, operators):
        self.start = start
        self.finish = finish
        self.numbers = numbers
        self.operators = operators
        # self.brackets = brackets

    def print(self):
        print('Level:')
        print('\tStart:', self.start)
        print('\tFinish:', self.finish)
        print('\tNumber:', self.numbers)
        print('\tOperators:', self.operators)
        # print('\tBrackets:', self.brackets)

def generate():
    start = randint(-100, 100)
    finish = randint(-100, 100)
    count = randint(1, len(numbers))
    num = sample(list(numbers), count)

    count = randint(0, len(operators))
    op = sample(list(operators), count)

    # print(start, finish, count, buttons)
    return Level(start, finish, num, op)

# level = generate()
# level.print()

def isSign(char):
    return ['+', '-', '*', '/'].count(char)

def check(level):
    iterations = 10000
    max_clicks = 15

    success = 0
    count = 0

    for i in range(iterations):
        line = str(level.start)
        hasPoint = False
        br_count = 0
        for j in range(max_clicks):

            p = random()

            if p < 0.5 and len(level.operators):
                # add operator
                if isSign(line[-1]):
                    line = line[:-1]
                
                line += choice(level.operators)
                hasPoint = False
            # elif p < 0.5 and level.brackets and isSign(line[-1]):
            #     # add bracket (
            #     line += '('
            #     br_count += 1
            #     hasPoint = False
            # elif p < 0.6 and level.brackets and br_count > 0:
            #     line += ')'
            #     br_count -= 1
            #     hasPoint = False
            else:
                # add number or point
                if p < 0.6 and level.operators.count('.') and not hasPoint:
                    line += '.'
                    hasPoint = True
                else:
                    line += choice(level.numbers)

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
eps = 0.0001

ready = []

while True:
    level = generate()
    result = check(level)

    percent = result[0] / result[1]

    if percent > eps:
        levels += 1
        # print('Level #', levels, sep='')
        # level.print()
        # print(result[0], 'out of', result[1], '-', percent)
        # print('--------------------------------')
        ready.append((percent, level))

    count += 1

    # print('--------', levels, 'out of', count, '-----------')

    if levels == 50:
        break

ready.sort()
ready.reverse()

for i in range(len(ready)):
    (percent, level) = ready[i]

    print('Level #', i + 1, sep='')

    print('\tPercent:', percent)

    level.print()
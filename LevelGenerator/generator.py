import random
import level

def generate():
    numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
    operators = ['+', '-', '*', '/', '*(-1)']

    start = random.randint(-100, 100)
    finish = random.randint(-100, 100)
    count = random.randint(1, len(numbers))
    num = random.sample(list(numbers), count)

    count = random.randint(0, len(operators))
    op = random.sample(list(operators), count)

    return level.Level(start, finish, num, op)
import random

def check(level):
    def isSign(char):
        return ['+', '-', '*', '/'].count(char)

    iterations = 1000
    max_clicks = 15

    success = 0
    count = 0

    for i in range(iterations):
        line = str(level.start)
        hasPoint = False

        for j in range(max_clicks):

            p = random.random()

            if p < 0.5 and len(level.operators):
                # add operator
                if isSign(line[-1]):
                    line = line[:-1]
                
                line += random.choice(level.operators)
                hasPoint = False
            else:
                # add number
                line += random.choice(level.numbers)

            try:
                result = eval(line)
                line = str(result)
            except:
                result = level.finish - 1
                continue

            count += 1
            if result == level.finish:
                success += 1
                break

    return (success, count)
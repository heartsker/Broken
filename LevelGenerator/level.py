class Level:
    def __init__(self, start, finish, numbers, operators):
        self.start = start
        self.finish = finish
        self.numbers = numbers
        self.operators = operators

    def print(self):
        print('\tStart:', self.start)
        print('\tFinish:', self.finish)
        print('\tNumber:', self.numbers)
        print('\tOperators:', self.operators)
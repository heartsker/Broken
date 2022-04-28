class Group:
    def __init__(self, level, difficulty, best_score):
        self.level = level
        self.difficulty = difficulty
        self.best_score = best_score

    def __lt__(self, other):
        return self.difficulty < other.difficulty
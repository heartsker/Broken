def bestScore(level):
    tree = { str(level.start) : 0 }

    while not str(level.finish) in tree.keys():
        old = list(tree.keys())

        for start in old:
            for end in level.buttons():
                line = start + end
                try:
                    result = eval(line)
                except:
                    result = line
                    pass

                if not str(result) in tree.keys():
                    tree[str(result)] = tree[start] + 1
                else:
                    tree[str(result)] = min(tree[str(result)], tree[start] + 1)

    return tree[str(level.finish)]
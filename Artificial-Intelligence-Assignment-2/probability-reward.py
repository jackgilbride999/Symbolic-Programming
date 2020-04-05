# Recall from the lecture that Sam is either fit or unfit
# S = {fit, unfit}
# and has to decide whether to exercise or relax
# A = {exercise, relax}
# on the basis of the following (probability, reward)-matrices
# (p(s,a,s'), r(s,a,s')) for row s, column s' in table with corner a
exercise = {
    's_fit': {
        'sdash_fit': [.99, 8],
        'sdash_unfit': [.01, 8]
    },
    's_unfit': {
        'sdash_fit': [.2, 0],
        'sdash_unfit': [.8, 0]
    }
}

relax = {
    's_fit': {
        'sdash_fit': [.7, 10],
        'sdash_unfit': [.3, 10]
    },
    's_unfit': {
        'sdash_fit': [0, 5],
        'sdash_unfit': [1, 5]
    }
}
print(exercise.get('s_fit').get('sdash_fit')[0])
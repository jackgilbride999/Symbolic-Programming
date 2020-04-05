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
# reworking this data structure?

# for indexing into first level of list, i.e. parameter a
EXERCISE = 0
RELAX = 1

# for indexing into second & third level of list, i.e 
# parameters s & s'
FIT = 0
UNFIT = 1

plist = [
    [[.99, .01], [.2, .8]],
    [[.7, .3], [0, 1]]
]

rlist = [
    [[8, 8], [0, 0]],
    [[10, 10], [5, 5]]
]


# The γ-discounted value of (s, a) is
# lim n->∞ qn(s,a)
# where
# q0(s,a) := p(s,a,fit)r(s,a,fit) + p(s,a,unfit)r(s,a,unfit)
def p(s, a, sdash):
    return plist[a][s][sdash]

print(p(FIT, RELAX, FIT))
# Recall from the lecture that Sam is either fit or unfit
# S = {fit, unfit}
# and has to decide whether to exercise or relax
# A = {exercise, relax}
# on the basis of the following (probability, reward)-matrices
# (p(s,a,s'), r(s,a,s')) for row s, column s' in table with corner a

# for indexing into first level of list, i.e. parameter a
EXERCISE = 0
RELAX = 1

# for indexing into second & third level of list, i.e
# parameters s & s'
FIT = 0
UNFIT = 1
DEAD = 2

plist = [
    [[.99, .01], [.2, .8]],
    [[.7, .3], [0, 1]]
]

rlist = [
    [[8, 8], [0, 0]],
    [[10, 10], [5, 5]]
]


def p(s, a, sdash):
    return plist[a][s][sdash]


def r(s, a, sdash):
    return rlist[a][s][sdash]

# The γ-discounted value of (s, a) is
# lim n->∞ qn(s,a)
# where


def q(n, s, a):
    if(n == 0):  # q0
        return p(s, a, FIT)*r(s, a, FIT) + p(s, a, UNFIT)*r(s, a, UNFIT)
    else:       # qn+1
        return q(0, s, a) + gamma*(p(s, a, FIT)*v(n-1, FIT) + p(s, a, UNFIT)*v(n-1, UNFIT))


def v(n, s):  # vn
    return max(q(n, s, EXERCISE), q(n, s, RELAX))


while True:
    try:
        n = int(input("Please enter your positive integer n:"))
        gamma = float(input("Please enter your γ-setting G (0<G<1):"))
        if gamma <= 0 or gamma >= 1:
            raise Exception
        s = (input("Please enter your starting state s:"))
        if s == "fit":
            s = FIT
        elif s == "unfit":
            s = UNFIT
        elif s == "dead":
            s = DEAD
        else:
            raise Exception
        exercise_output = q(n, s, EXERCISE)
        relax_output = q(n, s, RELAX)
        print("qn(s, exercise) = ", exercise_output)
        print("qn(s, relax) = ", relax_output)
    except:
        print("Invalid inputs. Please try again.", gamma)

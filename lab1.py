from sympy import *
from mpmath import findroot

a = Symbol("a", real=True)
M = []
for i in range(2, 8):
    row = [a for _ in range(i)]
    m = Matrix([row for _ in range(i)])
    for j in range(i):
        m[j, j] = 1
    M.append(m)

for i, m in enumerate(M):
    d = m.det()
    print('n = ' + str(i + 2), ": ", d)
e = Symbol("eps", real=True)

bound = [1-e**2,
     1 -3*e**2,
     -3*e**4-6*e**2+1,
     -15*e**4-10*e**2+1,
     -5*e**6-45*e**4-15*e**2+1,
     -35*e**6-105*e**4-21*e**2+1,
     -7*e**8-140*e**6-210*e**4-28*e**2+1,
     -63*e**8-420*e**6-378*e**4-36*e**2+1]

with open("table.csv", "w") as f:
    f.write("$n$, $\frac{1}{(n - 1)}$, $\vareps^*$ \n")
    for i in range(7):
        val1 = 1 / (i + 1)
        val2 = findroot(lambda x: bound[i].evalf(subs={e: x}), 0.2)
        v1 = float('{:.3f}'.format(val1))
        v2 = float('{:.3f}'.format(round(val2, 4)))
        v3 = float('{:.3f}'.format(round(val2 - val1, 4)))
        f.write(str(i + 2) + "," + str(v1) + "," + str(v2) + "," +'\n')
        print(i + 2, ': [', bound[i], '; ', bound[i], ']')
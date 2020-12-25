import numpy as np
from scipy.optimize import linprog as lp
from matplotlib import pyplot as plt
from tolsolvty import tolsolvty

if __name__ == "__main__":
    A = np.array([[1.2, -2, 1],
                 [1, -2, 1],
                 [7, 0, 0]])
    mid_b = np.array([1.5, 3.5, 2.5])
    rad_b = np.array([0.5, 0.5, 0.5])
    inf_b = mid_b - rad_b
    sup_b = mid_b + rad_b
    print("Для исходной системы:")
    infb = np.array([[inf_b[0]], [inf_b[1]], [inf_b[2]]])
    supb = np.array([[sup_b[0]], [sup_b[1]], [sup_b[2]]])
    [tolmax, argmax, envs, ccode] = tolsolvty(A, A, infb, supb)
    print('tolmax = ', tolmax)
    print('argmax = ', argmax)
    print('envs = ', envs)
    print('ccode = ', ccode)
    print()

# подготавливаем задачу линейного программирования
    n = 3
    c = np.hstack([np.zeros(3), np.ones(3)])
    neg_diag = -np.diag(rad_b)
    r = np.hstack([-mid_b, mid_b])
    A_big = np.block([[-A, neg_diag], [A, neg_diag]])


    def solve(bounds, name_method):
        res = lp(c, A_big, r, bounds=bounds,
                         method=name_method)
        omega_sum_s = sum(res.x[n:])
        x_s = res.x[:-n]
        return omega_sum_s, x_s


    def relation(name_method):
        x_1 = []
        x_2 = []
        x_3 = [0.1 * i for i in range(11)]
        for lower in x_3:
            bounds = [(None, None), (None, None), (lower, lower + 0.5)] + [(0, None)]*n
            omega_sum_s, x_s = solve(bounds, name_method)
            x_1.append(x_s[0])
            x_2.append(x_s[1])
        return x_1, x_2

    def draw(name_method, x_1, x_2, x_3):
        line1, = plt.plot(x_3, x_1, label='$x_1$')
        line2, = plt.plot(x_3, x_2, label='$x_2$')
        plt.legend(handles=[line1, line2], loc='lower right')
        plt.title(name_method)
        plt.xlabel('$x_3$')
        plt.savefig(name_method + '.png')
        plt.show()
        plt.close()

    def experimet(name_method):
        print(name_method)
        print("Безусловная оптимизация")
        w = solve([(None, None)] * n + [(0, None)] * n, name_method)
        print("sum w =", sum(w))
        x_1, x_2 = relation(name_method)
        x_3 = [0.1 * i for i in range(11)]
        draw(name_method, x_1, x_2, x_3)
        return x_1, x_2, x_3

    x_1s, x_2s, x_3s = experimet('simplex')
    x_1i, x_2i, x_3i = experimet('interior-point')

    plt.plot(x_3s, x_1s, label='$x_1$ simplex')
    plt.plot(x_3s, x_2s, label='$x_2$ simplex')
    plt.plot(x_3i, x_1i, label='$x_1$ interior point')
    plt.plot(x_3i, x_2i, label='$x_2$ interior point')
    plt.legend(loc='upper right')
    plt.title('All solutions')
    plt.xlabel('$x_3$')
    plt.savefig('all.png')
    plt.show()
    plt.close()
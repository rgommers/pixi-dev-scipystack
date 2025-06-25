import numpy as np
from scipy.interpolate import CubicSpline
import matplotlib.pyplot as plt

def main():
    x = np.linspace(0, 10, num=11)
    y = np.cos(-x**2 / 9.)
    spl = CubicSpline(x, y)

    fig, ax = plt.subplots(4, 1, figsize=(5, 7))
    xnew = np.linspace(0, 10, num=1001)
    ax[0].plot(xnew, spl(xnew))
    ax[0].plot(x, y, 'o', label='data')
    ax[1].plot(xnew, spl(xnew, nu=1), '--', label='1st derivative')
    ax[2].plot(xnew, spl(xnew, nu=2), '--', label='2nd derivative')
    ax[3].plot(xnew, spl(xnew, nu=3), '--', label='3rd derivative')
    for j in range(4):
        ax[j].legend(loc='best')
    plt.tight_layout()
    plt.show()

if __name__ == "__main__":
    main()

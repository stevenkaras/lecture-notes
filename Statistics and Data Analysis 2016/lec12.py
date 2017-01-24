#!/usr/bin/env python3

import scipy.stats

experiments = 500
coin = scipy.stats.binom(100, 0.3)
nullcoin = scipy.stats.binom(100, 0.4)
tosses = sorted([nullcoin.cdf(t) for t in coin.rvs(experiments)])
fdr = [(tosses[i] * experiments / (i + 1)) for i in range(len(tosses))]
robfdr = [min(fdr[i:]) for i in range(len(fdr))]

import matplotlib.pyplot as plt

# # Overabundance plot
# plt.scatter([t / 500.0 for t in range(500)], list(range(500)), c='black', marker='.')
# plt.scatter(tosses, list(range(len(tosses))))
# plt.show()

# # FDR plot
# plt.scatter(list(range(len(fdr))), fdr, c='r', marker='x')
# # RobFDR plot
# plt.scatter(list(range(len(robfdr))), robfdr, c='g', marker='x')
# plt.axhline(y = 0.05)
# plt.show()


# Car factory data
german_scores = [3.2, 4.5, 8.1, 9.9, 4.1, 7.3, 5.2, 6.0,]
randomistan_scores = [3.7, 8.5, 6.1, 9.3, 9.1, 4.3, 7.2,]

print(scipy.stats.ranksums(german_scores, randomistan_scores))

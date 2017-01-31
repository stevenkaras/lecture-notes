#!/usr/bin/env python3

import scipy.stats

# The tibia exercise revisited
# Men have a mean tibia of 40 with stddev of 3
# Women have a mean tibia of 26 with stddev of 2
male_tibia = scipy.stats.norm(loc=40, scale=3)
female_tibia = scipy.stats.norm(loc=36, scale=2)

def f(x):
    return 0.5 * male_tibia.cdf(x) + 0.5 * female_tibia.cdf(x)

def g(alpha):
    return f(38 - alpha) + 1 - f(38 + alpha)

print('portion of population not covered by 10 inch tolerance: %s' % g(10))


# Particle emission/chi squared example

# NOTE: 0 is 0-2, and last is 17+
observed_data = [
    18,
    28,
    56,
   105,
   126,
   146,
   164,
   161,
   123,
   101,
    74,
    53,
    23,
    15,
     9,
     5,
]

print('Total number of observed particles: %s' % sum((i+2) * observed_data[i] for i in range(len(observed_data))))

expected = scipy.stats.poisson(8.39)
expected_pmf = [expected.pmf(i+2) for i in range(len(observed_data))]
expected_pmf[0] = expected.cdf(2)
expected_pmf[-1] = expected.sf(len(observed_data))

expected_data = [expected_pmf[i] * 1207 for i in range(len(expected_pmf))]
print(scipy.stats.chisquare(observed_data, expected_data))



#!/usr/bin/env python3

with open('haberman.csv') as file:
  data = [[float(field) for field in line.split(',')]
    for line in file.readlines()]

young = [record for record in data if record[0] < 50]
old = [record for record in data if record[0] >= 60]

young_lnm = [record[2] for record in young]
old_lnm = [record[2] for record in old]

y_tot = len(young_lnm)
o_tot = len(old_lnm)

# Plot them against each other

import numpy
by_lnm, bins = numpy.histogram(young_lnm, 20)
bo_lnm, _ = numpy.histogram(old_lnm, bins)

y_freq = by_lnm / y_tot
o_freq = bo_lnm / o_tot

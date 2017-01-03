#!/usr/bin/env python3

with open('haberman.csv') as file:
  data = [[float(field) for field in line.split(',')]
    for line in file.readlines()]

young = [record for record in data if record[0] < 50]
old = [record for record in data if record[0] >= 60]

young_survival = [record[3] for record in young]
old_survival = [record[3] for record in old]

y_tot = len(young_survival)
o_tot = len(old_survival)

y_sct = sum(1 for r in young_survival if r == 1)
o_sct = sum(1 for r in old_survival if r == 1)

y_survival_rate = y_sct / y_tot
o_survival_rate = o_sct / o_tot

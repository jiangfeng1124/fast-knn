#!/bin/bash

# Python(SciPy)
time python python/query.py -e example.dat -k 10 > py.sim

# R
time Rscript R/query.R > r.sim

# Cpp
time ./cpp/query.sh


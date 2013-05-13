#!/bin/bash

data=example.dat
bin=/home/jiangfeng/Work/fast-knn/cpp/ann_1.1.2/bin

$bin/ann_sample -d 25 -max 5000 -nn 10 -df $data -qf $data > cpp.sim


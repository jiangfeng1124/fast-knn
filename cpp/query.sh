#!/bin/bash

root=`pwd`
data=example.dat
bin=$root/cpp/ann_1.1.2/bin

$bin/ann_sample -d 25 -max 5000 -nn 10 -df $data -qf $data > cpp.sim


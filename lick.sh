#!/bin/sh

set -x
echo "10 Threads"
/opt/likwid/bin/likwid-perfctr -f -C 60-69 -g FLOPS_SP ./kmeans_openmp/kmeans -n 10 -i $1
/opt/likwid/bin/likwid-perfctr -f -C 60-69 -g MEM      ./kmeans_openmp/kmeans -n 10 -i $1
#set -x

echo "80 Threads"
#set +x
/opt/likwid/bin/likwid-perfctr -f -C 0-79 -g FLOPS_SP ./kmeans_openmp/kmeans -n 80 -i $1
/opt/likwid/bin/likwid-perfctr -f -C 0-79 -g MEM      ./kmeans_openmp/kmeans -n 80 -i $1



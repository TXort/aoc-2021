
# Name:   AOC_2021_DAY6_PART2
# Author: Ort
# Date:   2021/12/06
import Pkg;
Pkg.add("StatsBase");
using LinearAlgebra, DelimitedFiles, StatsBase

freq = countmap(vec(readdlm("C:/Users/Ort/Desktop/input.txt", ',', Int)))
input = [
    try
        freq[i]
    catch _
        0
    end for i ∈ 0:8
]

step = [0 1 0 0 0 0 0 0 0
    0 0 1 0 0 0 0 0 0
    0 0 0 1 0 0 0 0 0
    0 0 0 0 1 0 0 0 0
    0 0 0 0 0 1 0 0 0
    0 0 0 0 0 0 1 0 0
    1 0 0 0 0 0 0 1 0
    0 0 0 0 0 0 0 0 1
    1 0 0 0 0 0 0 0 0]

print(sum(step^256 * input))

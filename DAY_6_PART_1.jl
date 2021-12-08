
# Name:   AOC_2021_DAY6_PART1
# Author: Ort
# Date:   2021/12/06

function solve(days, file = "C:/Users/Ort/Desktop/input.txt")
    f = open(file, "r")
    startingFish = parse.(Int, split(readline(f), ","))
    lanternfish = zeros(Int64, 9)
    for f in startingFish
        lanternfish[f+1] += 1
    end
    for _ = 1:days
        zs = popfirst!(lanternfish)
        lanternfish[7] += zs
        push!(lanternfish, zs)
    end
    sum(lanternfish)
end

print(solve(80));

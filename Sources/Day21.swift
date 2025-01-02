//
// Advent of Code 2023 Day 21
//
// https://adventofcode.com/2023/day/21
//

import AoCTools

private struct Grid {
    let grid: [[Character]]
    let start: Point

    init(_ string: String) {
        var grid = string.lines.map { $0.map { $0 } }
        let startY = grid.firstIndex { $0.contains("S") }!
        let startX = grid[startY].firstIndex { $0 == "S" }!
        grid[startY][startX] = "."
        self.grid = grid
        self.start = Point(startX, startY)
    }

    subscript(index: Point) -> Character {
        let x = map(index.x, grid[0].count)
        let y = map(index.y, grid.count)
        return grid[y][x]
    }

    private func map(_ value: Int, _ max: Int) -> Int {
        let mod = value % max
        return mod < 0 ? max + mod : mod
    }
}

final class Day21: AdventOfCodeDay {
    let title = "Step Counter"
    
    private let grid: Grid
    let maxSteps: Int

    convenience init(input: String) {
        self.init(input: input, maxSteps: 64)
    }

    init(input: String, maxSteps: Int) {
        self.grid = Grid(input)
        self.maxSteps = maxSteps
    }

    func part1() -> Int {
        var steps = [Point: Set<Int>]()

        floodFill(grid, &steps, from: grid.start, step: 1, max: maxSteps)
        return steps.values.compactMap { $0 }.filter { $0.contains(maxSteps) }.count
    }

    func part2() -> Int {
        let width = grid.grid[0].count
        // part 2 not solved in code. ¯\_(ツ)_/¯

        // our max steps of 26501365 is 202300 * 131 + 65, where 131 is the width of our input grid
        // step 1: figure out 3 data points: count(65), count(65+131) and count(65+131+131)
        // step 2: plug the results in to wolfram alpha (https://www.wolframalpha.com/input?i=quadratic+fit+calculator&assumption=%7B%22F%22%2C+%22QuadraticFitCalculator%22%2C+%22data3x%22%7D+-%3E%22%7B0%2C+1%2C+2%7D%22&assumption=%7B%22F%22%2C+%22QuadraticFitCalculator%22%2C+%22data3y%22%7D+-%3E%22%7B3814%2C+33952%2C+94138%7D%22
        // x: {0, 1, 2}
        // y: {3814, 33952, 94138}
//        for i in 0..<3 {
//            let maxSteps = 65 + i * width
//            var steps = [Point: Set<Int>]()
//            floodFill(grid, &steps, from: grid.start, step: 1, max: maxSteps)
//            let count = steps.filter { $0.value.contains(maxSteps) }.count
//            print(maxSteps, count)
//        }

        // step3: plug 202300 into the quadratic formula that WA spits out
        let x = 26501365 / width
        return 15024 * x * x + 15114 * x + 3814
    }

    private func floodFill(_ grid: Grid, _ steps: inout [Point: Set<Int>], from start: Point, step: Int, max: Int) {
        if step > max {
            return
        }

        let neighbors = start.neighbors().filter {
            grid[$0] == "."
        }

        for n in neighbors {
            if steps[n]?.contains(step) == true {
                continue
            }
            steps[n, default: []].insert(step)
            floodFill(grid, &steps, from: n, step: step + 1, max: max)
        }
    }
}

//
// Advent of Code 2023 Day 21
//
// https://adventofcode.com/2023/day/21
//

import AoCTools

final class Day21: AOCDay {
    let grid: [[Character]]
    let start: Point
    let maxSteps: Int

    convenience init(input: String) {
        self.init(input: input, maxSteps: 64)
    }

    init(input: String, maxSteps: Int) {
        var grid = input.lines.map { $0.map { $0 } }
        let startY = grid.firstIndex { $0.contains("S") }!
        let startX = grid[startY].firstIndex { $0 == "S" }!
        grid[startY][startX] = "."
        self.grid = grid
        self.start = Point(startX, startY)
        self.maxSteps = maxSteps
    }

    func part1() -> Int {
        var steps = [[Set<Int>]](repeating: [Set<Int>](repeating: [0], count: grid[0].count), count: grid.count)

        floodFill(grid, &steps, from: start, step: 1, max: maxSteps)
        // draw(grid: grid, steps: steps)
        return steps.flatMap { $0 }.filter { $0.contains(maxSteps) }.count
    }

    func part2() -> Int {
        return 0
    }

    private func draw(grid: [[Character]], steps: [[Set<Int>]]) {
        for y in 0..<steps.count {
            for x in 0..<steps[0].count {
                if grid[y][x] == "#" {
                    print("#", terminator: "")
                } else {
                    print(steps[y][x].contains(maxSteps) ? "O" : ".", terminator: "")
                }
            }
            print()
        }
    }

    private func floodFill(_ grid: [[Character]], _ steps: inout[[Set<Int>]], from start: Point, step: Int, max: Int) {
        if step > max {
            return
        }

        let neighbors = start.neighbors().filter {
            0 ..< grid[0].count ~= $0.x && 0 ..< grid.count ~= $0.y && grid[$0.y][$0.x] == "."
        }

        for n in neighbors {
            if steps[n.y][n.x].contains(step) {
                continue
            }
            steps[n.y][n.x].insert(step)
            floodFill(grid, &steps, from: n, step: step + 1, max: max)
        }
    }
}

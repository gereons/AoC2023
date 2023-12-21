//
// Advent of Code 2023 Day 21
//
// https://adventofcode.com/2023/day/21
//

import AoCTools

private struct Grid {
    private let grid: [[Character]]
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
        if mod < 0 {
            let v2 = max + mod
            return v2 == max ? 0 : v2
        }
        return mod
    }
}

final class Day21: AOCDay {
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
        // draw(grid: grid, steps: steps)
        return steps.values.compactMap { $0 }.filter { $0.contains(maxSteps) }.count
    }

    func part2() -> Int {
        return 0
    }

    private func draw(grid: Grid, steps: [Point: Set<Int>]) {
        let minX = steps.keys.min(of: \.x)!
        let maxX = steps.keys.max(of: \.x)!
        let minY = steps.keys.min(of: \.y)!
        let maxY = steps.keys.max(of: \.y)!

        for y in minY ... maxY {
            for x in minX ... maxX {
                let p = Point(x, y)
                if grid[p] == "#" {
                    print("#", terminator: "")
                } else {
                    print(steps[p]?.contains(maxSteps) == true ? "O" : ".", terminator: "")
                }
            }
            print()
        }
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

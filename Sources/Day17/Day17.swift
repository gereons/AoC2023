//
// Advent of Code 2023 Day 17
//
// https://adventofcode.com/2023/day/17
//

import AoCTools

private struct State: Hashable {
    let position: Point
    let direction: Direction?
    let chainLength: Int

    init(position: Point, direction: Direction? = nil, chainLength: Int = 0) {
        self.position = position
        self.direction = direction
        self.chainLength = chainLength
    }
}

private struct City: Pathfinding {
    private let grid: [[Int]]
    private let chainRange: ClosedRange<Int>

    init(grid: [[Int]], chainRange: ClosedRange<Int>) {
        self.grid = grid
        self.chainRange = chainRange
    }

    func neighbors(of state: State) -> [State] {
        var result = [State]()
        for dir in Direction.orthogonal {
            if let direction = state.direction {
                if direction == dir.opposite {
                    continue
                }
                if direction == dir && state.chainLength == chainRange.upperBound {
                    continue
                }
                if direction != dir && state.chainLength < chainRange.lowerBound {
                    continue
                }
            }
            let position = state.position.moved(to: dir)
            if !isInside(position) {
                continue
            }
            let chainLength = dir == state.direction ? state.chainLength + 1 : 1
            result.append(State(position: position, direction: dir, chainLength: chainLength))
        }
        return result
    }

    func goalReached(at current: State, goal: State) -> Bool {
        current.position == goal.position && current.chainLength >= chainRange.lowerBound
    }

    func costToMove(from: State, to: State) -> Int {
        grid[to.position.y][to.position.x]
    }

    func distance(from: State, to: State) -> Int {
        1
    }

    private func isInside(_ point: Point) -> Bool {
        0 ..< grid.count ~= point.y && 0 ..< grid[0].count ~= point.x
    }
}

final class Day17: AOCDay {
    private let grid: [[Int]]
    private var maxX: Int { grid[0].count }
    private var maxY: Int { grid.count }

    init(input: String) {
        grid = input.lines.map { $0.map { $0.wholeNumberValue! }}
    }

    func part1() -> Int {
        let city = City(grid: grid, chainRange: 0...3)
        return totalHeatloss(in: city)
    }

    func part2() -> Int {
        let city = City(grid: grid, chainRange: 4...10)
        return totalHeatloss(in: city)
    }

    private func totalHeatloss(in city: City) -> Int {
        let pathfinder = AStarPathfinder(map: city)

        let start = State(position: .zero)
        let goal = State(position: Point(maxX - 1, maxY - 1))
        let path = pathfinder.shortestPath(from: start, to: goal)

        return path.map { grid[$0.position.y][$0.position.x] }.reduce(0, +)
    }
}

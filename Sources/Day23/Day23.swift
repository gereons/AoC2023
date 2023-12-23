//
// Advent of Code 2023 Day 23
//
// https://adventofcode.com/2023/day/23
//

import AoCTools
// paths (.), forest (#), and steep slopes (^, >, v, and <).
private enum Tile: Equatable {
    case path
    case forest
    case slope(Direction)

    init(_ ch: Character) {
        switch ch {
        case ".": self = .path
        case "#": self = .forest
        case "^": self = .slope(.n)
        case "<": self = .slope(.w)
        case ">": self = .slope(.e)
        case "v": self = .slope(.s)
        default: fatalError()
        }
    }
}

final class Day23: AOCDay {
    private let maze: [[Tile]]
    private let start: Point
    private let end: Point

    init(input: String) {
        maze = input.lines.map { $0.map { Tile($0) } }
        let startX = maze[0].firstIndex { $0 == .path }!
        start = Point(startX, 0)
        let endX = maze[maze.count - 1].firstIndex { $0 == .path }!
        end = Point(endX, maze.count - 1)
    }

    func part1() -> Int {
        findLongestPath(canClimb: false)
    }

    func part2() -> Int {
        findLongestPath(canClimb: true)
    }

    private func findLongestPath(canClimb: Bool) -> Int {
        var pathLengths = [Int]()
        dfs(from: start, to: end, canClimb: canClimb, [], [], &pathLengths)

        return pathLengths.max()!
    }

    private func dfs(from start: Point, to end: Point, canClimb: Bool, _ visited: Set<Point>, _ currentPath: [Point], _ pathLengths: inout [Int]) {
        if start == end {
            let pathLength = currentPath.count
            pathLengths.append(pathLength)
            return
        }

        var visited = visited
        var currentPath = currentPath
        visited.insert(start)
        for n in neighbors(of: start, canClimb: canClimb) {
            if visited.contains(n) { continue }
            currentPath.append(n)
            dfs(from: n, to: end, canClimb: canClimb, visited, currentPath, &pathLengths)
            currentPath.removeLast()
        }
        visited.remove(start)
    }

    private func neighbors(of point: Point, canClimb: Bool) -> [Point] {
        var neighbors = [Point]()
        for direction in [Direction.n, .s, .e, .w] {
            let np = point.moved(to: direction)
            if np.x < 0 || np.x >= maze[0].count || np.y < 0 || np.y >= maze.count { continue }
            switch maze[np.y][np.x] {
            case .path: neighbors.append(np)
            case .forest: continue
            case .slope(let slopeDir):
                if canClimb || slopeDir == direction {
                    neighbors.append(np)
                }
            }
        }
        return neighbors
    }
}

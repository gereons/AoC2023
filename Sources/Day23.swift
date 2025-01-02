//
// Advent of Code 2023 Day 23
//
// https://adventofcode.com/2023/day/23
//

import AoCTools
// paths (.), forest (#), and steep slopes (^, >, v, and <).
private enum Tile: Equatable {
    case path
    case slope(Direction)

    var isSlope: Bool {
        switch self {
        case .path: return false
        case .slope: return true
        }
    }

    init?(_ ch: Character) {
        switch ch {
        case ".": self = .path
        case "^": self = .slope(.n)
        case "<": self = .slope(.w)
        case ">": self = .slope(.e)
        case "v": self = .slope(.s)
        default: return nil
        }
    }
}

final class Day23: AdventOfCodeDay {
    let title = "A Long Walk"
    
    private let maze: [Point: Tile]
    private let start: Point
    private let end: Point

    init(input: String) {
        let lines = input.lines
        let points = lines.enumerated().flatMap { y, line in
            line.enumerated().compactMap { x, ch in
                if let tile = Tile(ch) {
                    return (Point(x, y), tile)
                } else {
                    return nil
                }
            }
        }
        maze = Dictionary(uniqueKeysWithValues: points)
        start = maze.keys.first { $0.y == 0 }!
        end = maze.keys.first { $0.y == lines.count - 1}!
    }

    func part1() -> Int {
        longestPath(from: start, to: end)
    }

    func part2() -> Int {
        // pre-compute junctions and all paths between them
        let junctions = junctions()
        let paths = pathsBetween(junctions)

        return longestPath(from: start, to: end, seen: [start], paths: paths)
    }

    // MARK: - part 1
    private func longestPath(from start: Point, to end: Point) -> Int {
        var queue = [(last: start, path: Set([start]))]
        var maxLength = 0
        while let (last, path) = queue.popLast() {
            if last == end {
                maxLength = max(maxLength, path.count - 1)
            }

            for n in neighbors(of: last) {
                if !path.contains(n) {
                    queue.append((n, path + [n]))
                }
            }
        }
        return maxLength
    }

    private func neighbors(of point: Point) -> [Point] {
        var neighbors = [Point]()
        for direction in Direction.orthogonal {
            let np = point.moved(to: direction)
            switch maze[np] {
            case .none: 
                continue
            case .path: 
                neighbors.append(np)
            case .slope(let slopeDirection):
                if slopeDirection == direction {
                    neighbors.append(np)
                }
            }
        }
        return neighbors
    }

    // MARK: - part 2
    private func longestPath(from start: Point, to end: Point, seen: Set<Point>, paths: [Point: [(Point, Int)]]) -> Int {
        if start == end {
            return 0
        }

        var longest = 0
        for (point, length) in paths[start]! {
            if seen.contains(point) { continue }
            let best = longestPath(from: point, to: end, seen: seen + [point], paths: paths)
            longest = max(longest, best + length)
        }
        return longest
    }

    private func junctions() -> Set<Point> {
        var junctions = [start, end]
        for (point, tile) in maze {
            if tile != .path { continue }
            let nSlopes = point.neighbors().count { maze[$0]?.isSlope == true }
            if nSlopes > 1 {
                junctions.append(point)
            }
        }
        return Set(junctions)
    }

    private func pathsBetween(_ junctions: Set<Point>) -> [Point: [(Point, Int)]] {
        var paths = [Point: [(Point, Int)]]() // from -> (to, length)
        for junction in junctions {
            for neighbor in junction.neighbors().filter({ maze[$0] != nil }) {
                var current = neighbor
                var path = Set([junction])
                repeat {
                    path.insert(current)
                    let next = current.neighbors().filter { maze[$0] != nil && !path.contains($0) }
                    if next.isEmpty { continue }
                    current = next[0]
                } while !junctions.contains(current)
                paths[junction, default: []].append((current, path.count))
            }
        }
        return paths
    }
}

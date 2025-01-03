//
// Advent of Code 2023 Day 16
//
// https://adventofcode.com/2023/day/16
//

import AoCTools

private struct Beam: Hashable {
    var direction: Direction
    var position: Point

    func split(_ newDirection: Direction) -> Beam {
        return Beam(direction: newDirection, position: self.position)
    }
}

final class Day16: AdventOfCodeDay {
    let title = "The Floor Will Be Lava"
    
    let grid: [[Character]]
    let maxX: Int
    let maxY: Int

    init(input: String) {
        grid = input.lines.map { line in
            line.map { $0 }
        }
        maxX = grid[0].count
        maxY = grid.count
    }

    func part1() -> Int {
        let start = Beam(direction: .e, position: Point(-1, 0))
        return energized(startingAt: start)
    }

    func part2() -> Int {
        var maxEnergized = 0
        for y in 0..<maxY {
            let startLeft = Beam(direction: .e, position: Point(-1, y))
            maxEnergized = max(maxEnergized, energized(startingAt: startLeft))

            let startRight = Beam(direction: .w, position: Point(maxX, y))
            maxEnergized = max(maxEnergized, energized(startingAt: startRight))
        }
        for x in 0..<maxX {
            let startTop = Beam(direction: .s, position: Point(x, -1))
            maxEnergized = max(maxEnergized, energized(startingAt: startTop))

            let startBottom = Beam(direction: .n, position: Point(x, maxY))
            maxEnergized = max(maxEnergized, energized(startingAt: startBottom))
        }
        return maxEnergized
    }

    private func energized(startingAt beam: Beam) -> Int {
        var visited = Set<Beam>()
        var beams = [beam]

        while var beam = beams.popLast() {
            findPath(for: &beam, visited: &visited, beams: &beams)
        }
        return Set(visited.map { $0.position }).count
    }

    private func findPath(for beam: inout Beam, visited: inout Set<Beam>, beams: inout [Beam]) {
        while true {
            let moved = beam.position.moved(to: beam.direction)
            let inside = 0..<maxX ~= moved.x && 0..<maxY ~= moved.y
            if !inside {
                return // we moved out of bounds
            }

            beam.position = moved
            switch grid[moved.y][moved.x] {
            case ".": () // nop
            case "/": // reflect 90°
                switch beam.direction {
                case .n: beam.direction = .e
                case .w: beam.direction = .s
                case .s: beam.direction = .w
                case .e: beam.direction = .n
                default: fatalError()
                }
            case "\\": // reflect 90°
                switch beam.direction {
                case .n: beam.direction = .w
                case .w: beam.direction = .n
                case .s: beam.direction = .e
                case .e: beam.direction = .s
                default: fatalError()
                }
            case "-": // continue or split
                switch beam.direction {
                case .n: beam.direction = .w; beams.append(beam.split(.e))
                case .s: beam.direction = .e; beams.append(beam.split(.w))
                case .w, .e: () // nop
                default: fatalError()
                }
            case "|": // continue or split
                switch beam.direction {
                case .w: beam.direction = .n; beams.append(beam.split(.s))
                case .e: beam.direction = .s; beams.append(beam.split(.n))
                case .n, .s: () // nop
                default: fatalError()
                }
            default: fatalError()
            }
            let (inserted, _) = visited.insert(beam)
            if !inserted {
                return // we've been here before
            }
        }
    }
}

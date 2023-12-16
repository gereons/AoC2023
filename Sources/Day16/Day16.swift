//
// Advent of Code 2023 Day 16
//
// https://adventofcode.com/2023/day/16
//

import AoCTools

private struct Beam: Hashable, CustomStringConvertible {
    var direction: Direction
    var position: Point

    func split(_ newDirection: Direction) -> Beam {
        return Beam(direction: newDirection, position: self.position)
    }

    var description: String {
        "\(position.description)-\(direction)"
    }
}

final class Day16: AOCDay {
    let grid: [Point: Character]
    let maxX: Int
    let maxY: Int

    init(input: String) {
        let lines = input.lines
        maxX = lines[0].count - 1
        maxY = lines.count - 1
        let points = input.lines.enumerated().flatMap { y, line in
            line.enumerated().map { x, ch in
                (Point(x, y), ch)
            }
        }
        grid = Dictionary(uniqueKeysWithValues: points)
    }

    func part1() -> Int {
        var beams = [Beam(direction: .e, position: .zero.moved(to: .w))]
        var visited = Set<Beam>()

        while !beams.isEmpty {
            var beam = beams.remove(at: 0)
            findPath(for: &beam, visited: &visited, beams: &beams)
        }
        return Set(visited.map { $0.position }).count
    }

    private func findPath(for beam: inout Beam, visited: inout Set<Beam>, beams: inout [Beam]) {
        while true {
            let moved = beam.position.moved(to: beam.direction)
            if grid[moved] == nil {
                return
            }

            beam.position = moved
            switch grid[moved] {
            case ".": () // nop
            case "/": // reflect 90°
                switch beam.direction {
                case .n: beam.direction = .e
                case .w: beam.direction = .s
                case .s: beam.direction = .w
                case .e: beam.direction = .n
                default: fatalError()
                }
            case #"\"#: // reflect 90°
                switch beam.direction {
                case .n: beam.direction = .w
                case .w: beam.direction = .n
                case .s: beam.direction = .e
                case .e: beam.direction = .s
                default: fatalError()
                }
            case "-": //
                switch beam.direction {
                case .n: beam.direction = .w; beams.append(beam.split(.e))
                case .s: beam.direction = .e; beams.append(beam.split(.w))
                case .w, .e: () // nop
                default: fatalError()
                }
            case "|":
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
                return
            }
        }
    }

    func part2() -> Int {
        return 0
    }
}

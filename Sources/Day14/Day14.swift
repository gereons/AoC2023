//
// Advent of Code 2023 Day 14
//
// https://adventofcode.com/2023/day/14
//

import AoCTools

private enum Tile: Character {
    case ground = "."
    case roundRock = "O"
    case cubeRock = "#"
}

final class Day14: AOCDay {
    private let platform: [Point: Tile]

    init(input: String) {
        var platform = [Point: Tile]()
        for (y, line) in input.lines.enumerated() {
            for (x, ch) in line.enumerated() {
                platform[Point(x, y)] = Tile(rawValue: ch)!
            }
        }
        self.platform = platform
    }

    func part1() -> Int {
        var platform = platform
        tilt(&platform, to: .n)
        return load(on: platform)
    }

    func part2() -> Int {
        return 0
    }

    private func tilt(_ platform: inout [Point: Tile], to direction: Direction) {
        let maxX = platform.keys.max(of: \.x)!
        let maxY = platform.keys.max(of: \.y)!

        for y in 1...maxY {
            for x in 0...maxX {
                let point = Point(x, y)
                if platform[point]! != .roundRock { continue }
                // move to `direction` as far as possible
                move(point, in: &platform, to: direction)
            }
        }
    }

    private func move(_ point: Point, in platform: inout [Point: Tile], to direction: Direction) {
        var point = point
        while true {
            let movedPoint = point.moved(to: direction)
            if platform[movedPoint] == .ground {
                platform[movedPoint] = .roundRock
                platform[point] = .ground
                point = movedPoint
            } else {
                return
            }
        }
    }

    private func load(on platform: [Point: Tile]) -> Int {
        let maxY = platform.keys.max(of: \.y)!
        var sum = 0
        for y in 0...maxY {
            sum += platform.filter { $0.key.y == y && $0.value == .roundRock }.count * (maxY - y + 1)
        }
        return sum
    }
}

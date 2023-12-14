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
        var platform = platform

        var seen = [[Point: Tile]: Int]()
        var loopStart = -1
        var loopLength = -1

        for i in 1 ... 1_000_000_000 {
            cycle(&platform)

            if let step = seen[platform] {
                loopStart = step
                loopLength = i - step
                break
            } else {
                seen[platform] = i
            }
        }

        let remain = (1_000_000_000 - loopStart) % loopLength

        for _ in 0 ..< remain {
            cycle(&platform)
        }

        return load(on: platform)
    }

    private func cycle(_ platform: inout [Point: Tile]) {
        tilt(&platform, to: .n)
        tilt(&platform, to: .w)
        tilt(&platform, to: .s)
        tilt(&platform, to: .e)
    }

    private func tilt(_ platform: inout [Point: Tile], to direction: Direction) {
        let maxX = platform.keys.max(of: \.x)!
        let maxY = platform.keys.max(of: \.y)!

        var yRange = Array(0 ... maxY)
        var xRange = Array(0 ... maxX)
        switch direction {
        case .n, .w: ()
        case .s: yRange = yRange.reversed()
        case .e: xRange = xRange.reversed()
        default: fatalError()
        }

        for y in yRange {
            for x in xRange {
                let point = Point(x, y)
                if platform[point]! != .roundRock { continue }
                move(point, in: &platform, to: direction)
            }
        }
    }

    // move to `direction` as far as possible
    private func move(_ point: Point, in platform: inout [Point: Tile], to direction: Direction) {
        var point = point
        while true {
            assert(platform[point] == .roundRock)
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

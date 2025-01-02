//
// Advent of Code 2023 Day 14
//
// https://adventofcode.com/2023/day/14
//

import AoCTools

final class Day14: AdventOfCodeDay {
    let title = "Parabolic Reflector Dish"
    
    private let platform: [Point: Character]
    let maxX: Int
    let maxY: Int

    init(input: String) {
        var platform = [Point: Character]()
        let lines = input.lines
        maxX = lines[0].count - 1
        maxY = lines.count - 1

        for (y, line) in lines.enumerated() {
            for (x, ch) in line.enumerated() {
                platform[Point(x, y)] = ch
            }
        }
        self.platform = platform
    }

    private func draw(_ platform: [Point: Character]) {
        for y in 0...maxY {
            for x in 0...maxX {
                print(platform[Point(x, y)]!, terminator: "")
            }
            print("")
        }
        print("---")
    }

    func part1() -> Int {
        var platform = platform
        tilt(&platform, to: .n)
        return load(on: platform)
    }

    func part2() -> Int {
        var platform = platform

        var seen = [[Point: Character]: Int]()
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

    private func cycle(_ platform: inout [Point: Character]) {
        tilt(&platform, to: .n)
        tilt(&platform, to: .w)
        tilt(&platform, to: .s)
        tilt(&platform, to: .e)
    }

    private func tilt(_ platform: inout [Point: Character], to direction: Direction) {
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
                if platform[point]! != "O" {
                    continue
                }
                move(point, in: &platform, to: direction)
            }
        }
    }

    // move to `direction` as far as possible
    private func move(_ point: Point, in platform: inout [Point: Character], to direction: Direction) {
        var point = point
        platform[point] = "."
        while true {
            let movedPoint = point.moved(to: direction)
            if platform[movedPoint] == "." {
                point = movedPoint
            } else {
                break
            }
        }
        platform[point] = "O"
    }

    private func load(on platform: [Point: Character]) -> Int {
        (0...maxY).map { y in
            platform.filter { $0.key.y == y && $0.value == "O" }.count * (maxY - y + 1)
        }
        .reduce(0, +)
    }
}

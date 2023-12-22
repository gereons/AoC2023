//
// Advent of Code 2023 Day 22
//
// https://adventofcode.com/2023/day/22
//

import AoCTools

private struct Brick {
    let start: Point3
    let end: Point3

    init(_ string: String) {
        let parts = string.components(separatedBy: "~")
        let s = parts[0].allInts()
        let e = parts[1].allInts()
        start = Point3(s[0], s[1], s[2])
        end = Point3(e[0], e[1], e[2])
    }

    init(start: Point3, end: Point3) {
        self.start = start
        self.end = end
    }

    func dropped() -> Brick {
        Brick(start: Point3(start.x, start.y, start.z - 1),
              end: Point3(end.x, end.y, end.z - 1))
    }

    func step(_ path: KeyPath<Point3, Int>) -> Int {
        let s = start[keyPath: path]
        let e = start[keyPath: path]
        return s == e ? 1 : (e - s).signum()
    }

    var volume: [Point3] {
        var vol = [Point3]()
        for x in stride(from: start.x, through: end.x, by: step(\.x)) {
            for y in stride(from: start.y, through: end.y, by: step(\.y)) {
                for z in stride(from: start.z, through: end.z, by: step(\.z)) {
                    vol.append(Point3(x, y, z))
                }
            }
        }
        return vol
    }

    var minZ: Int { min(start.z, end.z) }
    var maxZ: Int { max(start.z, end.z) }

    func isDirectlyBelow(_ other: Brick) -> Bool {
        self.maxZ == other.minZ - 1
    }
}

final class Day22: AOCDay {
    private let bricks: [Brick]

    init(input: String) {
        bricks = input.lines.map { Brick($0) }
    }

    func part1() -> Int {
        // drop all bricks down as far as possible
        var volume = Set<Point3>()
        var droppedBricks = [Brick]()
        for brick in bricks.sorted(by: { $0.minZ < $1.minZ }) {
            var brick = brick
            while true {
                let dropped = brick.dropped()
                if dropped.minZ > 0 && volume.intersection(dropped.volume).isEmpty {
                    brick = dropped
                } else {
                    break
                }
            }
            volume.formUnion(brick.volume)
            droppedBricks.append(brick)
        }

        // find removable bricks
        var removable = 0

        for (index, brick) in droppedBricks.enumerated() {
            var supportsOther = false
            for brick2 in droppedBricks.dropFirst(index + 1) {
                if !brick.isDirectlyBelow(brick2) {
                    continue
                }
                let dropped = brick2.dropped()
                if dropped.minZ < 1 {
                    continue
                }
                let test = volume.subtracting(brick.volume).subtracting(brick2.volume)
                if test.intersection(dropped.volume).isEmpty {
                    supportsOther = true
                    break
                }
            }
            if !supportsOther {
                removable += 1
            }
        }

        return removable
    }

    func part2() -> Int {
        return 0
    }
}

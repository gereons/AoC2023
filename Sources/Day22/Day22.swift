//
// Advent of Code 2023 Day 22
//
// https://adventofcode.com/2023/day/22
//

import AoCTools

private struct Brick {
    let start: Point3
    let end: Point3
    let volume: Set<Point3>

    var minZ: Int { start.z }
    var maxZ: Int { end.z }

    init(_ string: String) {
        let parts = string.components(separatedBy: "~")
        let s = parts[0].allInts()
        let e = parts[1].allInts()
        self.init(start: Point3(s[0], s[1], s[2]),
                  end: Point3(e[0], e[1], e[2]))
    }

    init(start: Point3, end: Point3) {
        self.start = start
        self.end = end
        volume = Self.volume(for: start, end)
    }

    func dropped() -> Brick {
        Brick(start: Point3(start.x, start.y, start.z - 1),
              end: Point3(end.x, end.y, end.z - 1))
    }

    private static func volume(for start: Point3, _ end: Point3) -> Set<Point3> {
        var vol = [Point3]()
        for x in stride(from: start.x, through: end.x, by: 1) {
            for y in stride(from: start.y, through: end.y, by: 1) {
                for z in stride(from: start.z, through: end.z, by: 1) {
                    vol.append(Point3(x, y, z))
                }
            }
        }
        return Set(vol)
    }

    func isDirectlyBelow(_ other: Brick) -> Bool {
        self.maxZ == other.minZ - 1
    }

    func isSupported(by other: Brick) -> Bool {
        guard other.isDirectlyBelow(self) else { return false }
        let xOverlap = (self.start.x...self.end.x).overlaps(other.start.x...other.end.x)
        let yOverlap = (self.start.y...self.end.y).overlaps(other.start.y...other.end.y)
        return xOverlap || yOverlap
    }
}

final class Day22: AOCDay {
    private let bricks: [Brick]

    init(input: String) {
        bricks = input.lines.map { Brick($0) }
    }

    func part1() -> Int {
        let (droppedBricks, volume) = dropAll(bricks)

        // find removable bricks
        var removable = 0
        for (index, brick) in droppedBricks.enumerated() {
            if canRemove(brick, at: index, from: droppedBricks, volume) {
                removable += 1
            }
        }
        return removable
    }

    func part2() -> Int {
        let (droppedBricks, volume) = dropAll(bricks)

        var chainRemoved = 0
        for (index, brick) in droppedBricks.enumerated() {
            chainRemoved += checkChainReaction(index, brick, droppedBricks, volume)
        }
        return chainRemoved
    }

    private func checkChainReaction(_ index: Int, _ brick: Brick, _ bricks: [Brick], _ volume: Set<Point3>) -> Int {
        // unconditionally remove the first brick
        var removed = [brick]
        var volume = volume
        volume.subtract(brick.volume)

        // does this allow any later bricks to drop?
        var chain = 0
        for brick in bricks.dropFirst(index + 1) {
            let wasSupported = removed.contains { brick.isSupported(by: $0) }
            if wasSupported && canDrop(brick, in: volume) {
                chain += 1
                volume.subtract(brick.volume)
                removed.append(brick)
            }
        }

        return chain
    }

    private func canDrop(_ brick: Brick, in volume: Set<Point3>) -> Bool {
        let dropped = brick.dropped()
        return volume.subtracting(brick.volume).intersection(dropped.volume).isEmpty
    }

    // drop all bricks down as far as possible
    private func dropAll(_ bricks: [Brick]) -> ([Brick], Set<Point3>) {
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
        return (droppedBricks, volume)
    }

    private func canRemove(_ brick: Brick, at index: Int, from bricks: [Brick], _ volume: Set<Point3>) -> Bool {
        var supportsOther = false
        for brick2 in bricks.dropFirst(index + 1) {
            if !brick.isDirectlyBelow(brick2) || brick2.minZ == 1 {
                continue
            }
            let dropped = brick2.dropped()
            let testVolume = volume.subtracting(brick.volume).subtracting(brick2.volume)
            if testVolume.intersection(dropped.volume).isEmpty {
                supportsOther = true
                break
            }
        }
        return !supportsOther
    }
}

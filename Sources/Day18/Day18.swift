//
// Advent of Code 2023 Day 18
//
// https://adventofcode.com/2023/day/18
//

import AoCTools

private struct Dig {
    let direction: Direction
    let length: Int
    let color: UInt32

    static let dirMap: [String: Direction] = ["R": .e, "L": .w, "U": .n, "D": .s]

    init(_ string: String) {
        // R 6 (#70c710)
        let parts = string.components(separatedBy: " ")
        direction = Self.dirMap[parts[0]]!
        length = Int(parts[1])!
        color = UInt32(parts[2].substring(2, 6), radix: 16)!
    }
}

final class Day18: AOCDay {
    private let digs: [Dig]

    init(input: String) {
        digs = input.lines.map { Dig($0) }
    }

    func part1() -> Int {
        var point = Point.zero
        var map = Set([point])
        for dig in digs {
            for _ in 0 ..< dig.length {
                point = point.moved(to: dig.direction)
                map.insert(point)
            }
        }

        // draw(map)
        let start = findStart(in: map)
        floodFill(map: &map, from: start)
        return map.count
    }

    func part2() -> Int {
        return 0
    }

    private func findStart(in map: Set<Point>) -> Point {
        // find the topmost "left corner" that looks like
        // ##     <- minY
        // #.
        let minY = map.min(of: \.y)!
        let line1 = map.filter { $0.y == minY + 1 }.sorted(by: \.x)
        let start = line1.first!.moved(to: .e)
        assert(map.contains(start.moved(to: .n)))
        assert(map.contains(start.moved(to: .w)))
        assert(map.contains(start.moved(to: .nw)))
        return start
    }

    private func draw(_ map: Set<Point>) {
        let maxX = map.max(of: \.x)!
        let minX = map.min(of: \.x)!
        let maxY = map.max(of: \.y)!
        let minY = map.min(of: \.y)!

        for y in minY ... maxY {
            for x in minX ... maxX {
                let ch = map.contains(Point(x, y)) ? "#" : "."
                print(ch, terminator: "")
            }
            print()
        }
        print("---")
    }

    private func floodFill(map: inout Set<Point>, from start: Point) {
        var queue = [start]

        while let point = queue.popLast() {
            if map.contains(point) { continue }
            map.insert(point)
            let neighbors = point.neighbors().filter { !map.contains($0) }
            queue.append(contentsOf: neighbors)
        }
    }
}

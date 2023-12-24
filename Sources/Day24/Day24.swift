//
// Advent of Code 2023 Day 24
//
// https://adventofcode.com/2023/day/24
//

import AoCTools


private struct Stone {
    typealias P3 = (x: Double, y: Double, z: Double)

    let p: P3
    let v: P3

    // 19, 13, 30 @ -2,  1, -2
    init(_ string: String) {
        let parts = string.components(separatedBy: "@")
        let pos = parts[0].allInts().map { Double($0) }
        let vel = parts[1].allInts().map { Double($0) }
        p = (pos[0], pos[1], pos[2])
        v = (vel[0], vel[1], vel[2])
    }
}

final class Day24: AOCDay {
    private let stones: [Stone]
    private let range: ClosedRange<Double>

    convenience init(input: String) {
        self.init(input: input, range: 200000000000000.0 ... 400000000000000.0)
    }

    init(input: String, range: ClosedRange<Double>) {
        stones = input.lines.map { Stone($0) }
        self.range = range
    }

    func part1() -> Int {
        // https://en.wikipedia.org/wiki/Line%E2%80%93line_intersection
        var total = 0
        for pair in stones.combinations(of: 2) {
            let s1 = pair[0]
            let s2 = pair[1]
            let (slope1, intercept1) = slopeIntercept(for: s1)
            let (slope2, intercept2) = slopeIntercept(for: s2)

            if slope1 == slope2 {
                continue // lines are parallel or identical
            }

            let xCross = (intercept2 - intercept1) / (slope1 - slope2)
            let yCross = slope1 * xCross + intercept1
            if range ~= xCross && range ~= yCross {
                let tCross1 = (xCross - s1.p.x) / s1.v.x
                let tCross2 = (xCross - s2.p.x) / s2.v.x
                if tCross1 >= 0 && tCross2 >= 0 {
                    total += 1
                }
            }
        }

        return total
    }

    private func slopeIntercept(for stone: Stone) -> (slope: Double, intercept: Double) {
        let slope = stone.v.y / stone.v.x
        let intercept = stone.p.y - slope * stone.p.x
        return (slope, intercept)
    }

    func part2() -> Int {
        return 0
    }
}

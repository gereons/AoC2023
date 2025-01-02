//
// Advent of Code 2023 Day 13
//
// https://adventofcode.com/2023/day/13
//

import AoCTools

struct Pattern {
    let straight: [Int]
    let rotated: [Int]

    init(_ lines: [String]) {
        let rows = lines.count
        let columns = lines[0].count

        var straight = [Int](repeating: 0, count: rows)
        var rotated = [Int](repeating: 0, count: columns)

        for (y, line) in lines.enumerated() {
            for (x, ch) in line.reversed().enumerated() where ch == "#" {
                straight[y] += (1 << x)
                rotated[x] += (1 << y)
            }
        }

        self.straight = straight
        self.rotated = rotated.reversed()
    }
}

final class Day13: AdventOfCodeDay {
    let title = "Point of Incidence"
    
    let patterns: [Pattern]

    init(input: String) {
        let groups = input.lines.grouped { $0.isEmpty }

        patterns = groups.map { Pattern($0) }
    }

    func part1() -> Int {
        patterns
            .map { findReflection(in: $0, smudgesAllowed: 0) }
            .reduce(0, +)
    }

    func part2() -> Int {
        patterns
            .map { findReflection(in: $0, smudgesAllowed: 1) }
            .reduce(0, +)
    }

    private func findReflection(in pattern: Pattern, smudgesAllowed: Int) -> Int {
        let horizontal = findReflection(in: pattern.straight, smudgesAllowed: smudgesAllowed)
        if horizontal > 0 {
            return horizontal * 100
        }
        return findReflection(in: pattern.rotated, smudgesAllowed: smudgesAllowed)
    }

    private func findReflection(in array: [Int], smudgesAllowed: Int) -> Int {
        for line in 1..<array.count {
            var top = array[0..<line]
            var bottom = array[line...]
            if bottom.count > top.count {
                bottom = bottom.prefix(top.count)
            } else if bottom.count < top.count {
                top = top.suffix(bottom.count)
            }

            let zipped = zip(top, bottom.reversed())
            let xors = zipped.map { $0.0 ^ $0.1 }
            
            if xors.map(\.nonzeroBitCount).reduce(0, +) == smudgesAllowed {
                return line
            }
        }

        return 0
    }
}

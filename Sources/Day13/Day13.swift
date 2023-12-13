//
// Advent of Code 2023 Day 13
//
// https://adventofcode.com/2023/day/13
//

import AoCTools

private enum Ground: Character {
    case ash = "."
    case rock = "#"
}

private struct Pattern {
    let rows: [[Ground]]

    init(_ lines: [String]) {
        rows = lines.map { line in
            line.map { Ground(rawValue: $0)! }
        }
    }

    init(rows: [[Ground]]) {
        self.rows = rows
    }

    func rotated() -> Pattern {
        let rows = self.rows.count
        let columns = self.rows[0].count

        let emptyRow = [Ground](repeating: .ash, count: rows)
        var result = [[Ground]](repeating: emptyRow, count: columns)

        for (y, row) in self.rows.enumerated() {
            for (x, value) in row.enumerated() {
                result[x][y] = value
            }
        }

        return Pattern(rows: result)
    }

    func isMirrored(at index: Int) -> Bool {
        var i1 = index
        var i2 = index + 1

        while i1 >= 0 && i2 < rows.count {
            if rows[i1] != rows[i2] {
                return false
            }
            i1 -= 1
            i2 += 1
        }
        return true
    }
}

final class Day13: AOCDay {
    private let patterns: [Pattern]

    init(input: String) {
        let groups = input.lines.grouped { $0.isEmpty }

        patterns = groups.map { Pattern($0) }
    }

    func part1() -> Int {
        var sum = 0
        for pattern in patterns {
            if let horizontal = findReflection(in: pattern) {
                sum += 100 * horizontal
            } else if let vertical = findReflection(in: pattern.rotated()) {
                sum += vertical
            }
        }
        return sum
    }

    func part2() -> Int {
        return 0
    }

    private func findReflection(in pattern: Pattern) -> Int? {
        for (index, line) in pattern.rows.enumerated().dropLast() {
            if line == pattern.rows[index + 1] {
                // possible mirror
                if pattern.isMirrored(at: index) {
                    return index + 1
                }
            }
        }

        return nil
    }
}

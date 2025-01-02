//
// Advent of Code 2023 Day 12
//
// https://adventofcode.com/2023/day/12
//

import AoCTools

private struct Row: Hashable {
    let record: String
    let groups: [Int]

    init(_ string: String) {
        let parts = string.components(separatedBy: " ")
        record = parts[0]
        groups = parts[1].integers()
    }

    init<S: StringProtocol>(record: S, groups: [Int]) {
        self.record = String(record)
        self.groups = groups
    }

    var unfolded: Row {
        let rec = [String](repeating: self.record, count: 5).joined(separator: "?")
        let groups = [[Int]](repeating: self.groups, count: 5).flatMap { $0 }
        return Row(record: rec, groups: groups)
    }
}

final class Day12: AdventOfCodeDay {
    let title = "Hot Springs"
    
    private let rows: [Row]

    init(input: String) {
        rows = input.lines.map { Row($0) }
    }

    func part1() -> Int {
        rows
            .map { arrangements($0) }
            .reduce(0, +)
    }

    func part2() -> Int {
        rows
            .map { $0.unfolded }
            .map { arrangements($0) }
            .reduce(0, +)
    }

    private var cache = [Row: Int]()

    private func arrangements(_ row: Row) -> Int {
        if let cached = cache[row] {
            return cached
        } else {
            let value = _arrangements(row)
            cache[row] = value
            return value
        }
    }

    private func _arrangements(_ row: Row) -> Int {
        if row.groups.isEmpty {
            return row.record.contains("#") ? 0 : 1
        }
        if row.record.isEmpty {
            return 0
        }

        let ch = row.record.first!
        let group = row.groups.first!

        var sum = 0
        if ch == "#" {
            sum = pound(row, group)
        } else if ch == "." {
            sum = dot(row)
        } else if ch == "?" {
            sum = dot(row) + pound(row, group)
        }

        return sum
    }

    private func dot(_ row: Row) -> Int {
        arrangements(Row(record: row.record.dropFirst(), groups: row.groups))
    }

    private func pound(_ row: Row, _ group: Int) -> Int {
        let thisGroup = row.record
            .prefix(group)
            .replacingOccurrences(of: "?", with: "#")

        if thisGroup != String(repeating: "#", count: group) {
            return 0
        }

        if row.record.count == group {
            return row.groups.count == 1 ? 1 : 0
        }

        if "?.".contains(row.record[group]) {
            return arrangements(Row(record: row.record.dropFirst(group + 1),
                                    groups: Array(row.groups.dropFirst())))
        }
        return 0
    }
}

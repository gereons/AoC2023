//
// Advent of Code 2023 Day 12
//
// https://adventofcode.com/2023/day/12
//

import AoCTools

private struct Row {
    let status: [Status]
    let counts: [Int]

    init(_ string: String) {
        let parts = string.components(separatedBy: " ")
        status = parts[0].map { Status(rawValue: $0)! }
        counts = parts[1].allInts()
    }

    init(status: [Status], counts: [Int]) {
        self.status = status
        self.counts = counts
    }
}

private enum Status: Character {
    case broken = "#"
    case working = "."
    case unknown = "?"
}

final class Day12: AOCDay {
    private let rows: [Row]

    init(input: String) {
        rows = input.lines.map { Row($0) }
    }

    func part1() -> Int {
        rows
            .map { arrangements(for: $0) }
            .reduce(0, +)
    }

    func part2() -> Int {
        return 0
//        let rows = self.rows.map { unfold($0) }
//        return rows
//            .map { arrangements(for: $0) }
//            .reduce(0, +)
    }

    private func unfold(_ row: Row) -> Row {
        let counts = [[Int]](repeating: row.counts, count: 5)
            .flatMap { $0 }
        let status = [[Status]](repeating: row.status, count: 5)
            .joined(separator: [.unknown])
            .compactMap { $0 }
        return Row(status: status, counts: counts)
    }

    private func arrangements(for row: Row) -> Int {
        let totalCount = row.counts.reduce(0, +) - row.status.count { $0 == .broken }
        let unknowns = row.status.filter { $0 == .unknown }
        let allBits = (0..<(1<<unknowns.count))
            .filter { $0.nonzeroBitCount == totalCount }
            .map { bits(value: $0, length: unknowns.count) }

        var sum = 0
        for bits in allBits {
            var newStatus = row.status
            var bitsIndex = 0
            for (index, status) in row.status.enumerated() {
                if status == .unknown {
                    newStatus[index] = bits[bitsIndex] ? .broken : .working
                    bitsIndex += 1
                }
            }
            
            if brokenCounts(newStatus, matches: row.counts) {
                sum += 1
            }
        }
        return sum
    }

    private func brokenCounts(_ row: [Status], matches: [Int]) -> Bool {
        var result = [Int]()
        var prev = Status.working
        var count = 0
        for st in row {
            switch st {
            case .broken: 
                count += 1
            case .working:
                if st != prev {
                    result.append(count)
                    count = 0
                    if result[result.count-1] != matches[result.count-1] {
                        return false
                    }
                }
            case .unknown:
                fatalError()
            }
            prev = st
        }
        if count != 0 {
            result.append(count)
        }
        return result == matches
    }

    private func bits(value: Int, length: Int) -> [Bool] {
        var value = value
        var bits = [Bool](repeating: false, count: length)
        for i in (0 ..< length).reversed() {
            bits[i] = (value & 1) != 0
            value >>= 1
        }

        return bits
    }
}

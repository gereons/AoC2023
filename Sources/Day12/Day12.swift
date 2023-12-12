//
// Advent of Code 2023 Day 12
//
// https://adventofcode.com/2023/day/12
//

import AoCTools

// ???.### 1,1,3
// .??..??...?##. 1,1,3
// ?#?#?#?#?#?#?#? 1,3,1,6
// ????.#...#... 4,1,1
// ????.######..#####. 1,6,5
// ?###???????? 3,2,1

private struct Row {
    let status: [Status]
    let counts: [Int]

    init(_ string: String) {
        let parts = string.components(separatedBy: " ")
        status = parts[0].map { Status(rawValue: $0)! }
        counts = parts[1].allInts()
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
    }

    private func arrangements(for row: Row) -> Int {
        let unknowns = row.status.filter { $0 == .unknown }
        let allBits = (0..<(1<<unknowns.count)).map { bits(value: $0, length: unknowns.count) }

        var sum = 0
        for bits in allBits {
            var newStatus = [Status]()
            var bitsIndex = 0
            for status in row.status {
                switch status {
                case .broken, .working: newStatus.append(status)
                case .unknown:
                    newStatus.append(bits[bitsIndex] ? .broken : .working)
                    bitsIndex += 1
                }
            }
            
            if brokenCounts(newStatus) == row.counts {
                sum += 1
            }
        }
        return sum
    }

    private func brokenCounts(_ row: [Status]) -> [Int] {
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
                }
            case .unknown:
                fatalError()
            }
            prev = st
        }
        if count != 0 {
            result.append(count)
        }
        return result
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

//
// Advent of Code 2023 Day 1
//
// https://adventofcode.com/2023/day/1
//

import AoCTools

final class Day01: AOCDay {
    let lines: [String]

    init(input: String) {
        lines = input.lines
    }

    func part1() -> Int {
        lines.reduce(0) { acc, line in
            let digits = line.map { $0 }.compactMap { $0.wholeNumberValue }
            return acc + digits.first! * 10 + digits.last!
        }
    }

    func part2() -> Int {
        lines.reduce(0) { acc, line in
            let first = firstNumber(in: line)
            let last = lastNumber(in: line)
            return acc + first * 10 + last
        }
    }

    private let search = [
        "one", "two", "three", "four", "five", "six", "seven", "eight", "nine",
        "1", "2", "3", "4", "5", "6", "7", "8", "9"
    ]

    private func valueFor(_ index: Int) -> Int {
        index < 9 ? index + 1 : index - 8
    }

    private func firstNumber(in line: String) -> Int {
        var line = line

        while !line.isEmpty {
            for (index, str) in search.enumerated() {
                if line.hasPrefix(str) {
                    return valueFor(index)
                }
            }
            line.removeFirst()
        }
        fatalError()
    }

    private func lastNumber(in line: String) -> Int {
        var line = line

        while !line.isEmpty {
            for (index, str) in search.enumerated() {
                if line.hasSuffix(str) {
                    return valueFor(index)
                }
            }
            line.removeLast()
        }
        fatalError()
    }
}

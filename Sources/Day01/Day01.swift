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
            let digits = line.map { $0 }.compactMap { Int(String($0)) }
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

    private func firstNumber(in line: String) -> Int {
        var minIndex = Int.max
        var value = 0
        for (strIndex, str) in search.enumerated() {
            if let index = line.indexOf(str), index < minIndex {
                minIndex = index
                value = strIndex + 1
                if index == 0 { break }
            }
        }
        return value > 9 ? value - 9 : value
    }

    private func lastNumber(in line: String) -> Int {
        var maxIndex = Int.min
        var value = 0
        for (strIndex, str) in search.enumerated() {
            if let index = line.lastIndexOf(str), index > maxIndex {
                maxIndex = index
                value = strIndex + 1
                if index == line.count - str.count { break }
            }
        }
        return value > 9 ? value - 9 : value
    }
}

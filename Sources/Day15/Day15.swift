//
// Advent of Code 2023 Day 15
//
// https://adventofcode.com/2023/day/15
//

import AoCTools

final class Day15: AOCDay {
    let tokens: [String]

    init(input: String) {
        tokens = input.components(separatedBy: ",")
    }

    func part1() -> Int {
        tokens.map { hash($0) }.reduce(0, +)
    }

    func part2() -> Int {
        return 0
    }

    private func hash(_ string: String) -> Int {
        var hash = 0
        for ch in string {
            hash += Int(ch.asciiValue!)
            hash *= 17
            hash = hash % 256
        }
        return hash
    }
}

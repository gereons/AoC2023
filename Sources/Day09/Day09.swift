//
// Advent of Code 2023 Day 9
//
// https://adventofcode.com/2023/day/9
//

import AoCTools

final class Day09: AOCDay {
    let sequences: [[Int]]

    init(input: String) {
        sequences = input.lines.map { $0.allInts() }
    }

    func part1() -> Int {
        sequences.map { findNext(in: $0) }.reduce(0, +)
    }

    func part2() -> Int {
        sequences.map { findPrevious(in: $0) }.reduce(0, +)
    }

    private func findNext(in sequence: [Int]) -> Int {
        let deltas = getDeltas(for: sequence)
        var last = deltas.last!.last!
        for i in (0 ..< deltas.count - 1).reversed() {
            last = deltas[i].last! + last
        }
        return sequence.last! + last
    }

    private func findPrevious(in sequence: [Int]) -> Int {
        let deltas = getDeltas(for: sequence)
        var first = deltas.last!.first!
        for i in (0 ..< deltas.count - 1).reversed() {
            first = deltas[i].first! - first
        }
        return sequence.first! - first
    }

    private func getDeltas(for sequence: [Int]) -> [[Int]] {
        var deltas = [[Int]]()
        var seq = sequence
        while true {
            let delta = seq.adjacentPairs().map { $0.1 - $0.0 }
            deltas.append(delta)
            if delta.allSatisfy({ $0 == 0 }) {
                break
            }
            seq = delta
        }
        return deltas
    }
}

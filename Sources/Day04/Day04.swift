//
// Advent of Code 2023 Day 4
//
// https://adventofcode.com/2023/day/4
//

import AoCTools
import Foundation

struct Card {
    let id: Int
    let winners: Set<Int>
    let numbers: Set<Int>

    init(_ string: String) {
        // Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
        let parts = string.components(separatedBy: ":")
        self.id = parts[0].allInts().first!
        let numbers = parts[1].components(separatedBy: "|")
        self.winners = Set(numbers[0].allInts())
        self.numbers = Set(numbers[1].allInts())
    }

    var matches: Int {
        numbers.intersection(winners).count
    }

    var points: Int {
        1 << (matches - 1) // pow(2, matches - 1)
    }
}

final class Day04: AOCDay {
    let cards: [Card]

    init(input: String) {
        cards = input.lines.map { Card($0) }
    }

    func part1() -> Int {
        cards.map { $0.points }.reduce(0, +)
    }

    func part2() -> Int {
        var copies = [Int](repeating: 1, count: cards.count + 1)
        copies[0] = 0

        for card in cards where card.matches > 0 {
            for i in card.id + 1 ... card.id + card.matches where i < copies.count + 1 {
                copies[i] += copies[card.id]
            }
        }
        return copies.reduce(0, +)
    }
}

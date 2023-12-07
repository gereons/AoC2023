//
// Advent of Code 2023 Day 7
//
// https://adventofcode.com/2023/day/7
//

import AoCTools

private enum Rank: Int, Comparable {
    case highCard
    case pair
    case twoPair
    case three
    case fullHouse
    case four
    case five

    static func < (lhs: Rank, rhs: Rank) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

private class Hand {
    let cards: [Character]
    let bid: Int

    private var _rank: Rank?
    private var _jokerRank: Rank?

    init(_ string: String) {
        let parts = string.components(separatedBy: " ")
        cards = parts[0].map { $0 }
        bid = Int(parts[1]) ?? 0
    }

    var rank: Rank {
        if _rank == nil {
            _rank = getRank()
        }
        return _rank!
    }

    var jokerRank: Rank {
        if _jokerRank == nil {
            _jokerRank = getJokerRank()
        }
        return _jokerRank!
    }

    private func getRank() -> Rank {
        let dict = cards.reduce(into: [:]) { $0[$1, default: 0] += 1}

        return switch dict.count {
        case 1: .five
        case 2: dict.values.contains(4) ? .four : .fullHouse
        case 3: dict.values.contains(3) ? .three : .twoPair
        case 4: .pair
        case 5: .highCard
        default: fatalError()
        }
    }

    private func getJokerRank() -> Rank {
        var dict = cards.reduce(into: [:]) { $0[$1, default: 0] += 1}
        let jokers = dict.removeValue(forKey: "J") ?? 0
        let max = dict.values.max() ?? 0

        switch dict.count {
        case 0:
            // no cards left -> JJJJJ -> five
            return .five
        case 1:
            // all cards are the same:
            // 11111 -> five
            // 1111J -> five
            // 1111x -> four
            // 111JJ -> five
            // 11JJJ -> five
            // 1JJJJ -> five
            if jokers == 0 {
                return max == 4 ? .four : .five
            }
            return .five
        case 2:
            // two kinds of cards:
            // 1122J -> FH
            // 11122 -> FH
            // 1112J -> 4
            // 122JJ -> 4
            // 12JJJ -> 4
            switch jokers {
            case 0: 
                return dict.values.contains(4) ? .four : .fullHouse
            case 1:
                switch max {
                case 3: return jokers == 1 ? .four : .fullHouse
                case 2: return .fullHouse
                default: fatalError()
                }
            case 2, 3: return .four
            default: fatalError()
            }
        case 3:
            // three kinds of cards:
            // 11223 -> 2P
            // 123JJ -> 3
            // 1123J -> 3
            // 11123 -> 3
            if jokers == 0 {
                return dict.values.contains(2) ? .twoPair : .three
            }
            return .three
        case 4:
            // four kinds of cards:
            // 1234J -> 2
            // 11234 -> 2
            return .pair
        case 5:
            return .highCard
        default:
            fatalError()
        }
    }
}

extension Hand {
    // "J" is Jack -> value 11
    private static let map: [Character: Int] = [
        "A": 14, "K": 13, "Q": 12, "J": 11, "T": 10, "9": 9, "8": 8, "7": 7, "6": 6, "5": 5, "4": 4, "3": 3, "2": 2
    ]

    static func compareRank (lhs: Hand, rhs: Hand) -> Bool {
        if lhs.rank != rhs.rank {
            return lhs.rank < rhs.rank
        }

        for (c1, c2) in zip(lhs.cards, rhs.cards) {
            if c1 != c2 {
                return map[c1]! < map[c2]!
            }
        }
        fatalError()
    }

    // "J" is Joker -> value 1
    private static let jokerMap: [Character: Int] = [
        "A": 14, "K": 13, "Q": 12, "J": 1, "T": 10, "9": 9, "8": 8, "7": 7, "6": 6, "5": 5, "4": 4, "3": 3, "2": 2
    ]

    static func compareJokerRank (lhs: Hand, rhs: Hand) -> Bool {
        if lhs.jokerRank != rhs.jokerRank {
            return lhs.jokerRank < rhs.jokerRank
        }

        for (c1, c2) in zip(lhs.cards, rhs.cards) {
            if c1 != c2 {
                return jokerMap[c1]! < jokerMap[c2]!
            }
        }
        fatalError()
    }
}

final class Day07: AOCDay {
    private let hands: [Hand]

    init(input: String) {
        hands = input.lines.map { Hand($0) }
    }

    func part1() -> Int {
        sumBids(hands.sorted(by: Hand.compareRank))
    }

    func part2() -> Int {
        sumBids(hands.sorted(by: Hand.compareJokerRank))
    }

    private func sumBids(_ hands: [Hand]) -> Int {
        hands
            .enumerated()
            .reduce(0) {
                $0 + ($1.offset + 1) * $1.element.bid
            }
    }
}

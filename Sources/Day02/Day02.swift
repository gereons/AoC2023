//
// Advent of Code 2023 Day 2
//
// https://adventofcode.com/2023/day/2
//

import AoCTools

private struct Game {
    let id: Int
    let sets: [Set]

    struct Set {
        var red = 0
        var green = 0
        var blue = 0

        init(red: Int, green: Int, blue: Int) {
            self.red = red
            self.green = green
            self.blue = blue
        }

        init(_ string: String) {
            for color in string.components(separatedBy: ",") {
                let s = color.trimmed().components(separatedBy: " ")
                let value = Int(s[0])!
                switch s[1] {
                case "red": self.red = value
                case "green": self.green = value
                case "blue": self.blue = value
                default: fatalError()
                }
            }
        }

        var power: Int {
            max(red, 1) * max(green, 1) * max(blue, 1)
        }

        var isPossible: Bool {
            red <= 12 && green <= 13 && blue <= 14
        }
    }

    init(_ str: String) {
        let parts = str.components(separatedBy: ": ")
        self.id = Int(String(parts[0].dropFirst(5)))!
        self.sets = parts[1].components(separatedBy: ";").map { Set($0) }
    }

    var isPossible: Bool {
        sets.allSatisfy { $0.isPossible }
    }

    var minimumSet: Set {
        Set(
            red: sets.max(of: \.red) ?? 0,
            green: sets.max(of: \.green) ?? 0,
            blue: sets.max(of: \.blue) ?? 0
        )
    }
}

final class Day02: AOCDay {
    private let games: [Game]

    init(input: String) {
        games = input.lines.map { Game($0) }
    }

    func part1() -> Int {
        games.filter { $0.isPossible }.map(\.id).reduce(0, +)
    }

    func part2() -> Int {
        games.map(\.minimumSet.power).reduce(0, +)
    }
}

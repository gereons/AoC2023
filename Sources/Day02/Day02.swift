//
// Advent of Code 2023 Day 2
//
// https://adventofcode.com/2023/day/2
//

import AoCTools

struct Game {
    let id: Int
    let sets: [Set]

    struct Set {
        let red: Int
        let green: Int
        let blue: Int

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
        var gameSets = [Set]()
        let sets = parts[1].components(separatedBy: ";")
        for set in sets {
            let colors = set.components(separatedBy: ",").map { $0.trimmed() }
            var red = 0, green = 0, blue = 0
            for c in colors {
                let s = c.components(separatedBy: " ")
                switch s[1] {
                case "red": red = Int(s[0])!
                case "green": green = Int(s[0])!
                case "blue": blue = Int(s[0])!
                default: fatalError()
                }
            }
            gameSets.append(Set(red: red, green: green, blue: blue))
        }
        self.sets = gameSets
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
    let games: [Game]

    init(input: String) {
        games = input.lines.map { Game($0) }
    }

    func part1() -> Int {
        games.filter { $0.isPossible }.reduce(0) { $0 + $1.id }
    }

    func part2() -> Int {
        games.map { $0.minimumSet.power }.reduce(0, +)
    }
}

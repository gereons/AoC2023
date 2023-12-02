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
        sets.allSatisfy {
            $0.red <= 12 && $0.green <= 13 && $0.blue <= 14
        }
    }

    var minimumSet: Set {
        var red = 0, green = 0, blue = 0
        sets.forEach {
            red = max(red, $0.red)
            green = max(green, $0.green)
            blue = max(blue, $0.blue)
        }
        return Set(red: red, green: green, blue: blue)
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

//
// Advent of Code 2023 Day 6
//
// https://adventofcode.com/2023/day/6
//

import AoCTools

private struct Race {
    let time: Int
    let distance: Int

    func waysToWin() -> Int {
        var startWinning = 0
        var endWinning = 0

        for press in 1 ..< time {
            let distance = press * (time - press)
            if distance > self.distance {
                startWinning = press
                break
            }
        }

        for press in (1 ..< time).reversed() {
            let distance = press * (time - press)
            if distance > self.distance {
                endWinning = press
                break
            }
        }

        return endWinning - startWinning + 1
    }
}

final class Day06: AOCDay {
    private let races: [Race]
    private let part2Race: Race

    init(input: String) {
        let lines = input.lines

        let times = lines[0].allInts()
        let distances = lines[1].allInts()

        races = zip(times, distances).map { Race(time: $0, distance: $1) }

        let totalTime = lines[0].replacingOccurrences(of: " ", with: "").allInts()[0]
        let totalDistance = lines[1].replacingOccurrences(of: " ", with: "").allInts()[0]
        part2Race = Race(time: totalTime, distance: totalDistance)
    }

    func part1() -> Int {
        races
            .map { $0.waysToWin() }
            .reduce(1, *)
    }

    func part2() -> Int {
        part2Race.waysToWin()
    }
}

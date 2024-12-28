//
// Advent of Code 2023 Day 5
//
// https://adventofcode.com/2023/day/5
//

import AoCTools
import Algorithms

private struct Almanac {
    let seeds: [Int]

    let maps: [Map]

    init(_ lines: [String]) {
        seeds = lines[0].integers()
        let chunks = Array(lines.dropFirst(2)).grouped { $0.isEmpty }

        maps = chunks.map { Map($0) }
    }

    func location(for seed: Int) -> Int {
        var seed = seed
        for map in maps {
            if let range = map.ranges.first(where: { $0.contains(seed) }) {
                seed += range.adjustment
            }
        }
        return seed
    }
}

private struct Map {
    let ranges: [Range]

    init(_ lines: [String]) {
        self.ranges = lines.dropFirst().map { Range($0) }.sorted { $0.from < $1.from }
    }
}

private struct Range {
    let from: Int
    let to: Int
    let adjustment: Int

    init(from: Int, to: Int, adjustment: Int = 0) {
        self.from = from
        self.to = to
        self.adjustment = adjustment
    }

    init(_ string: String) {
        let ints = string.integers()
        self.init(from: ints[1], to: ints[1] + ints[2] - 1, adjustment: ints[0] - ints[1])
    }

    func contains(_ x: Int) -> Bool {
        x >= from && x <= to
    }

    var isValid: Bool { from <= to }
}

final class Day05: AOCDay {
    private let almanac: Almanac

    init(input: String) {
        almanac = Almanac(input.lines)
    }

    func part1() -> Int {
        var minLocation = Int.max
        for seed in almanac.seeds {
            let location = almanac.location(for: seed)
            minLocation = min(minLocation, location)
        }
        return minLocation
    }

    func part2() -> Int {
        var ranges = almanac.seeds
            .chunks(ofCount: 2)
            .map { Range(from: $0.first!, to: $0.first! + $0.last! - 1) }

        for map in almanac.maps {
            var newRanges = [Range]()
            for r in ranges {
                var range = r
                for mapping in map.ranges {
                    if range.from < mapping.from {
                        newRanges.append(Range(from: range.from, 
                                               to: min(range.to, mapping.from - 1)))
                        range = Range(from: mapping.from, to: range.to)
                        if !range.isValid {
                            break
                        }
                    }
                    if range.from <= mapping.to {
                        newRanges.append(Range(from: range.from + mapping.adjustment, 
                                               to: min(range.to, mapping.to) + mapping.adjustment))
                        range = Range(from: mapping.to + 1, to: range.to)
                        if !range.isValid {
                            break
                        }
                    }
                }
                if range.isValid {
                    newRanges.append(range)
                }
            }
            ranges = newRanges
        }

        return ranges.min(of: \.from)!
    }

    func part2_bruteForce() -> Int {
        let seedRanges = almanac.seeds
            .chunks(ofCount: 2)
            .map { $0.first! ..< $0.first! + $0.last! }

        var minLocation = Int.max
        for range in seedRanges {
            for seed in range {
                let location = almanac.location(for: seed)
                minLocation = min(minLocation, location)
            }
        }
        return minLocation
    }
}

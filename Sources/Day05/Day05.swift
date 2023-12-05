//
// Advent of Code 2023 Day 5
//
// https://adventofcode.com/2023/day/5
//

import AoCTools

private struct Almanac {
    let seeds: [Int]

    let maps: [Map]

    init(_ lines: [String]) {
        seeds = lines[0].allInts()
        let chunks = Array(lines.dropFirst(2)).grouped { $0.isEmpty }

        maps = chunks.map { Map($0) }
    }

    func location(for seed: Int) -> Int {
        var seed = seed
        for map in maps {
            if let range = map.ranges.first(where: { $0.contains(seed) }) {
                seed = seed - range.src + range.dest
            }
        }
        return seed
    }
}

private struct Range {
    let dest: Int
    let src: Int
    let length: Int

    init(_ string: String) {
        let ints = string.allInts()
        self.dest = ints[0]
        self.src = ints[1]
        self.length = ints[2]
    }

    func contains(_ x: Int) -> Bool {
        x >= src && x < (src + length)
    }
}

private struct Map {
    let name: String
    let ranges: [Range]

    init(_ lines: [String]) {
        self.name = lines[0]
        self.ranges = lines.dropFirst().map { Range($0) }
    }
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
        let seedRanges = almanac.seeds
            .chunked(2)
            .map { $0[0] ..< $0[0]+$0[1] }

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

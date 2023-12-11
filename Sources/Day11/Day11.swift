//
// Advent of Code 2023 Day 11
//
// https://adventofcode.com/2023/day/11
//

import AoCTools

final class Day11: AOCDay {
    let galaxies: [Point]

    init(input: String) {
        var galaxies = [Point]()
        for (y, line) in input.lines.enumerated() {
            for (x, ch) in line.enumerated() {
                if ch == "#" {
                    galaxies.append(Point(x, y))
                }
            }
        }
        self.galaxies = galaxies
    }

    func part1() -> Int {
        distanceSum(galaxies, growth: 2)
    }

    func part2() -> Int {
        distanceSum(galaxies, growth: 1_000_000)
    }

    func distanceSum(_ galaxies: [Point], growth: Int) -> Int {
        let galaxies = expand(galaxies, growth: growth)

        return galaxies
            .combinations(of: 2)
            .map { pair in
                pair[0].distance(to: pair[1])
            }
            .reduce(0, +)
    }

    private func expand(_ galaxy: [Point], growth: Int) -> [Point] {
        let minY = galaxy.min(of: \.y)!
        let maxY = galaxy.max(of: \.y)!

        var yExpanded = [Point]()
        var distance = 0
        for y in minY...maxY {
            let inRow = galaxy.filter { $0.y == y }
            if inRow.isEmpty {
                distance += growth - 1
            } else {
                for point in inRow {
                    yExpanded.append(Point(point.x, point.y + distance))
                }
            }
        }

        let minX = yExpanded.min(of: \.x)!
        let maxX = yExpanded.max(of: \.x)!
        distance = 0
        var xExpanded = [Point]()
        for x in minX...maxX {
            let inCol = yExpanded.filter { $0.x == x }
            if inCol.isEmpty {
                distance += growth - 1
            } else {
                for point in inCol {
                    xExpanded.append(Point(point.x + distance, point.y))
                }
            }
        }

        return xExpanded
    }
}

private extension Array {
    private func combinations(of elements: ArraySlice<Element>, count: Int) -> [[Element]] {
        guard count > 0 else { return [[]] }
        guard let first = elements.first else { return [] }

        let head = [first]
        let combos = combinations(of: elements.dropFirst(), count: count - 1)
        let withHead = combos.map { head + $0 }
        return withHead + combinations(of: elements.dropFirst(), count: count)
    }

    func combinations(of count: Int) -> [[Element]] {
        return combinations(of: ArraySlice(self), count: count)
    }
}

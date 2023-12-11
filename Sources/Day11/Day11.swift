//
// Advent of Code 2023 Day 11
//
// https://adventofcode.com/2023/day/11
//

import AoCTools

private enum Space: Character, Drawable {
    case empty = "."
    case galaxy = "#"
}

final class Day11: AOCDay {
    private let image: [[Space]]

    init(input: String) {
        image = input.lines.map {
            $0.map { Space(rawValue: $0)! }
        }
    }

    func part1() -> Int {
        let image = expand(image)

        var galaxies = [Point]()
        for y in 0..<image.count {
            for x in 0..<image[y].count {
                if image[y][x] == .galaxy {
                    galaxies.append(Point(x, y))
                }
            }
        }

        var total = 0
        for pair in galaxies.combinations(of: 2) {
            let distance = pair[0].distance(to: pair[1])
            total += distance
        }
        return total
    }

    func part2() -> Int {
        return 0
    }

    private func draw(_ image: [[Space]]) {
        for y in 0..<image.count {
            for x in 0..<image[y].count {
                print(image[y][x].rawValue, terminator: "")
            }
            print()
        }
    }

    private func expand(_ image: [[Space]]) -> [[Space]] {
        var newImage = [[Space]]()

        for y in 0 ..< image.count {
            newImage.append(image[y])
            if image[y].allSatisfy({ $0 == .empty }) {
                newImage.append(image[y])
            }
        }

        for x in (0 ..< newImage[0].count).reversed() {
            if (0 ..< newImage.count).allSatisfy({ newImage[$0][x] == .empty }) {
                (0 ..< newImage.count).forEach {
                    newImage[$0].insert(.empty, at: x)
                }
            }
        }

        return newImage
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

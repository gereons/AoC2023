//
// Advent of Code 2023 Day 3
//
// https://adventofcode.com/2023/day/3
//

import AoCTools

private struct Number: Hashable {
    let value: Int
    let start: Point
    let length: Int
    let neighbors: Set<Point>

    init(value: Int, start: Point, length: Int) {
        self.value = value
        self.start = start
        self.length = length
        neighbors = Set(
            (start.y - 1 ... start.y + 1).flatMap { y in
                (start.x - 1 ... start.x + length).map { x in
                    Point(x, y)
                }
            }
        )
    }
}

final class Day03: AOCDay {
    private let symbols: Set<Point>
    private let gears: Set<Point>
    private let numbers: Set<Number>

    init(input: String) {
        var symbols = Set<Point>()
        var gears = Set<Point>()
        var numbers = Set<Number>()

        for (y, line) in input.lines.enumerated() {
            for (x, ch) in line.enumerated() {
                if !(ch.isNumber || ch == ".") {
                    symbols.insert(Point(x, y))
                    if ch == "*" {
                        gears.insert(Point(x, y))
                    }
                }
            }

            let digits = line.enumerated().filter { $1.isNumber }
            if digits.isEmpty { continue }

            var value = digits[0].element.wholeNumberValue!
            var start = digits[0].offset
            var prevOffset = start
            var length = 1
            for d in digits.dropFirst() {
                if d.offset == prevOffset + 1 {
                    value = value * 10 + d.element.wholeNumberValue!
                    length += 1
                    prevOffset = d.offset
                } else {
                    numbers.insert(Number(value: value, start: Point(start, y), length: length))
                    value = d.element.wholeNumberValue!
                    length = 1
                    start = d.offset
                    prevOffset = start
                }
            }
            numbers.insert(Number(value: value, start: Point(start, y), length: length))
        }

        self.symbols = symbols
        self.gears = gears
        self.numbers = numbers
    }

    func part1() -> Int {
        numbers
            .filter { !symbols.intersection($0.neighbors).isEmpty }
            .map { $0.value }
            .reduce(0, +)
    }

    func part2() -> Int {
        gears
            .map { gear in
                numbers.filter { $0.neighbors.contains(gear) }
            }
            .filter { $0.count == 2 }
            .map { number in
                number.map { $0.value }.reduce(1, *)
            }
            .reduce(0, +)
    }
}

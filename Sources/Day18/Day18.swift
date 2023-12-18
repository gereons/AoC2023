//
// Advent of Code 2023 Day 18
//
// https://adventofcode.com/2023/day/18
//

import AoCTools

private struct Dig {
    typealias Instruction = (direction: Direction, length: Int)
    let part1: Instruction
    let part2: Instruction

    static let dirMap1: [String: Direction] = ["R": .e, "L": .w, "U": .n, "D": .s]
    static let dirMap2: [Int: Direction] = [0: .e, 2: .w, 3: .n, 1: .s]

    init(_ string: String) {
        // R 6 (#70c710)
        let parts = string.components(separatedBy: " ")
        part1 = (direction: Self.dirMap1[parts[0]]!, length: Int(parts[1])!)
        let color = Int(parts[2].substring(2, 6), radix: 16)!
        part2 = (direction: Self.dirMap2[color & 0xf]!, length: color >> 4)
    }
}

final class Day18: AOCDay {
    private let digs: [Dig]

    init(input: String) {
        digs = input.lines.map { Dig($0) }
    }

    func part1() -> Int {
        lagoonSize(with: digs, instructions: \.part1)
    }

    func part2() -> Int {
        lagoonSize(with: digs, instructions: \.part2)
    }

    private func lagoonSize(with digs: [Dig], instructions path: KeyPath<Dig, (Dig.Instruction)>) -> Int {
        var point = Point.zero
        var points = [point]
        for dig in digs.map({ $0[keyPath: path] }) {
            point = point.moved(to: dig.direction, steps: dig.length)
            points.append(point)
        }
        let circumference = digs.map { $0[keyPath: path].length }.reduce(0, +)

        let area = points
            .adjacentPairs()
            .map { ($0.x * $1.y) - ($0.y * $1.x) }
            .reduce(0, +)

        return area / 2 + circumference / 2 + 1
    }
}

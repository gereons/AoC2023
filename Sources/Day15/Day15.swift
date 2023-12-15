//
// Advent of Code 2023 Day 15
//
// https://adventofcode.com/2023/day/15
//

import AoCTools

private struct Lens {
    let label: String
    let focalLength: Int
}

private class Box {
    var lenses = [Lens]()
}

final class Day15: AOCDay {
    let tokens: [String]

    init(input: String) {
        tokens = input.components(separatedBy: ",")
    }

    func part1() -> Int {
        tokens.map { hash($0) }.reduce(0, +)
    }

    func part2() -> Int {
        let boxes = (0..<256).map { _ in Box() }
        for token in tokens {
            if token.hasSuffix("-") {
                // remove lens from its box
                let label = String(token.dropLast())
                boxes[hash(label)].lenses.removeAll { $0.label == label }
            } else {
                // add or change lens
                let parts = token.components(separatedBy: "=")
                let label = parts[0]
                let focalLength = Int(parts[1])!
                let box = boxes[hash(label)]
                if let index = box.lenses.firstIndex(where: { $0.label == label }) {
                    box.lenses[index] = Lens(label: label, focalLength: focalLength)
                } else {
                    box.lenses.append(Lens(label: label, focalLength: focalLength))
                }
            }
        }

        return boxes
            .enumerated().map { b, box in
                box.lenses.enumerated().map { l, lens in
                    (b + 1) * (l + 1) * lens.focalLength
                }
            }
            .flatMap { $0 }
            .reduce(0, +)
    }

    private func hash(_ string: String) -> Int {
        var hash = 0
        for ch in string {
            hash += Int(ch.asciiValue!)
            hash *= 17
            hash = hash % 256
        }
        return hash
    }
}

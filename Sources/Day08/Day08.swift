//
// Advent of Code 2023 Day 8
//
// https://adventofcode.com/2023/day/8
//

import AoCTools

private struct Node: Hashable {
    let name: String
    let left: String
    let right: String

    init(_ string: String) {
        let parts = string.components(separatedBy: " = ")
        name = parts[0]
        let leftright = parts[1].dropFirst().dropLast().components(separatedBy: ", ")
        left = leftright[0]
        right = leftright[1]
    }
}

final class Day08: AOCDay {
    let path: String
    private let nodes: [String: Node]

    init(input: String) {
        let lines = input.lines
        self.path = lines[0]
        let nodes = lines.dropFirst(2).map { Node($0) }
        self.nodes = nodes.mapped(by: \.name)
    }

    func part1() -> Int {
        let start = nodes["AAA"]!
        return pathLength(for: start, targetReached: { $0.name == "ZZZ" })
    }

    func part2() -> Int {
        let nodes = nodes.values.filter { $0.name.hasSuffix("A") }
        let lengths = nodes.map {
            pathLength(for: $0, targetReached: { $0.name.hasSuffix("Z") })
        }
        return lengths.reduce(into: 1) {
            $0 = lcm($0, $1)
        }
    }

    private func pathLength(for node: Node, targetReached: (Node) -> Bool) -> Int {
        var steps = 0
        var node = node
        while true {
            for direction in path {
                steps += 1
                switch direction {
                case "R": node = nodes[node.right]!
                case "L": node = nodes[node.left]!
                default: fatalError()
                }
                if targetReached(node) {
                    return steps
                }
            }
        }
    }
}

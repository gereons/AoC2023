//
// Advent of Code 2023 Day 25
//
// https://adventofcode.com/2023/day/25
//

import AoCTools

final class Day25: AOCDay {
    let connections: [String: Set<String>]

    init(input: String) {
        var connections = [String: Set<String>]()
        for line in input.lines {
            let parts = line.components(separatedBy: ":")
            let lhs = parts[0]
            let rhs = parts[1].split(separator: " ").map { String($0) }
            connections[lhs, default: []].formUnion(rhs)
            for r in rhs {
                connections[r, default:[]].insert(lhs)
            }
        }

        self.connections = connections
    }

    func part1() -> Int {
        // part 2 not solved in code, again. ¯\_(ツ)_/¯

        // instead, visualize the clusters using `neato` using the output printed by `graphViz()`
        // then, remove the 3 pairs that connect the two clusters and calculate the size of each
        var connections = connections
        for p in [("vxr","zhb"),("jbx","sml"),("vqj","szh")] {
            connections[p.0]?.remove(p.1)
            connections[p.1]?.remove(p.0)
        }

        let start = connections.keys.first!
        let reachable1 = allReachable(from: start, in: connections)
        let start2 = Set(connections.keys).subtracting(reachable1).first!
        let reachable2 = allReachable(from: start2, in: connections)

        if reachable1.count + reachable2.count == connections.keys.count {
            return reachable1.count * reachable2.count
        }
        fatalError()
    }

    private func graphViz() {
        print("digraph G {")
        for (key, conn) in connections {
            for c in conn {
                print("\(key) -> \(c)")
            }
        }
        print("}")
    }

    private func allReachable(from start: String, in connections: [String: Set<String>]) -> Set<String> {
        var result = Set<String>()
        var queue = [start]
        while let s = queue.popLast() {
            result.insert(s)
            for next in connections[s]! {
                if result.contains(next) { continue }
                queue.append(next)
            }
        }
        return result
    }

    func part2() -> Int {
        return 0
    }
}

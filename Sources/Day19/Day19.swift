//
// Advent of Code 2023 Day 19
//
// https://adventofcode.com/2023/day/19
//

import AoCTools

private enum Result {
    case accept
    case reject
    case newWorkflow(String)
}

private struct Workflow {
    let name: String
    let rules: [Rule]

    // qqz{s>2770:qs,m<1801:hdj,R}
    init(_ string: String) {
        let parts = string.components(separatedBy: "{")
        name = parts[0]
        rules = parts[1].dropLast().components(separatedBy: ",").map { Rule($0) }
    }

    func apply(to part: Part) -> Result {
        for rule in rules {
            if let result = rule.apply(to: part) {
                return result
            }
        }
        fatalError()
    }
}

private struct Rule {
    let property: String?
    let comparison: Comp
    let value: Int
    let result: String

    enum Comp: String {
        case lt = "<"
        case gt = ">"
    }

    // s>2770:qs or just "A"/"R"/"xyz"
    init(_ string: String) {
        let parts = string.components(separatedBy: ":")
        if parts.count == 1 {
            property = nil
            comparison = .lt
            value = 0
            result = parts[0]
        } else {
            property = parts[0].charAt(0)
            comparison = Comp(rawValue: parts[0].charAt(1))!
            value = Int(parts[0].dropFirst(2))!
            result = parts[1]
        }
    }

    func apply(to part: Part) -> Result? {
        var ok = true
        if let property {
            switch comparison {
            case .lt: ok = part[property] < value
            case .gt: ok = part[property] > value
            }
        }
        if !ok {
            return nil
        }
        switch result {
        case "A":
            return .accept
        case "R":
            return .reject
        default:
            return .newWorkflow(result)
        }
    }
}

private struct Part {
    let x, m, a, s: Int

    // {x=787,m=2655,a=1222,s=2876}
    init(_ string: String) {
        let ints = string.allInts()
        x = ints[0]
        m = ints[1]
        a = ints[2]
        s = ints[3]
    }

    var sum: Int { x + m + a + s }

    subscript(index: String) -> Int {
        switch index {
        case "x": return x
        case "m": return m
        case "a": return a
        case "s": return s
        default: fatalError()
        }
    }
}

private struct Range {
    let name: String
    var ranges: [String: ClosedRange<Int>]

    init(name: String, ranges: [String : ClosedRange<Int>]) {
        self.name = name
        self.ranges = ranges
    }

    var matches: Int {
        ranges.values.map { $0.upperBound - $0.lowerBound + 1 }.reduce(1, *)
    }
}

final class Day19: AOCDay {
    private let workflows: [String: Workflow]
    private let parts: [Part]

    init(input: String) {
        let groups = input.lines.grouped { $0.isEmpty }
        let workflows = groups[0].map { Workflow($0) }
        self.workflows = workflows.mapped(by: \.name)
        parts = groups[1].map { Part($0) }
    }

    func part1() -> Int {
        var accepted = [Part]()
        for part in parts {
            var workflow = workflows["in"]!
            var done = false
            while !done {
                switch workflow.apply(to: part) {
                case .accept:
                    accepted.append(part)
                    done = true
                case .reject:
                    done = true
                case .newWorkflow(let name):
                    workflow = workflows[name]!
                }
            }
        }

        return accepted.map { $0.sum }.reduce(0, +)
    }

    func part2() -> Int {
        let root = Range(name: "in", ranges: [
            "x": 1...4000,
            "m": 1...4000,
            "a": 1...4000,
            "s": 1...4000
        ])

        var queue = [root]
        var accepted = [Range]()
        while let range = queue.popLast() {
            let splits = split(range)
            accepted.append(contentsOf: splits.filter { $0.name == "A" })
            queue.append(contentsOf: splits)
        }

        return accepted.map { $0.matches }.reduce(0, +)
    }

    private func split(_ range: Range) -> [Range] {
        guard let workflow = workflows[range.name] else { return [] }

        var remainingRanges = range.ranges
        var result = [Range]()
        for rule in workflow.rules {
            if let property = rule.property {
                // split ranges
                let range = remainingRanges[property]!
                var newRange = Range(name: rule.result, ranges: remainingRanges)
                switch rule.comparison {
                case .lt:
                    newRange.ranges[property] = range.lowerBound ... rule.value - 1
                    remainingRanges[property] = rule.value ... range.upperBound
                case .gt: ()
                    newRange.ranges[property] = rule.value + 1 ... range.upperBound
                    remainingRanges[property] = range.lowerBound ... rule.value
                }
                result.append(newRange)
            } else {
                // go to workflow
                result.append(Range(name: rule.result, ranges: remainingRanges))
            }
        }
        return result
    }
}

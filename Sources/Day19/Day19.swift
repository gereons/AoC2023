//
// Advent of Code 2023 Day 19
//
// https://adventofcode.com/2023/day/19
//

import AoCTools
 /*
  px{a<2006:qkq,m>2090:A,rfg}
  pv{a>1716:R,A}
  lnx{m>1548:A,A}
  rfg{s<537:gd,x>2440:R,A}
  qs{s>3448:A,lnx}
  qkq{x<1416:A,crn}
  crn{x>2662:A,R}
  in{s<1351:px,qqz}

  gd{a>3333:R,R}
  hdj{m>838:A,pv}


  {x=1679,m=44,a=2067,s=496}
  {x=2036,m=264,a=79,s=2244}
  {x=2461,m=1339,a=466,s=291}
  {x=2127,m=1623,a=2188,s=1013}

  */

private enum Result {
    case `continue`
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
            let result = rule.apply(to: part)
            if case .continue = result {
                continue
            } else {
                return result
            }
        }
        fatalError()
    }
}

private struct Rule {
    let property: KeyPath<Part, Int>?
    let comparison: (Int) -> Bool
    let result: String

    // s>2770:qs or just "A"/"R"/"xyz"
    init(_ string: String) {
        let parts = string.components(separatedBy: ":")
        if parts.count == 1 {
            property = nil
            result = parts[0]
            comparison = { _ in fatalError() }
        } else {
            assert(parts.count == 2)
            switch parts[0].charAt(0) {
            case "x": property = \.x
            case "m": property = \.m
            case "a": property = \.a
            case "s": property = \.s
            default: fatalError()
            }
            let value = Int(parts[0].dropFirst(2))!
            switch parts[0].charAt(1) {
            case "<": comparison = { x in x < value }
            case ">": comparison = { x in x > value }
            default: fatalError()
            }
            result = parts[1]
        }
    }

    func apply(to part: Part) -> Result {
        var ok = true
        if let property {
            ok = comparison(part[keyPath: property])
        }
        if !ok {
            return .continue
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
            var wf = workflows["in"]!
            var done = false
            while !done {
                let result = wf.apply(to: part)
                switch result {
                case .accept: 
                    accepted.append(part)
                    done = true
                case .reject:
                    done = true
                case .newWorkflow(let name):
                    wf = workflows[name]!
                case .continue:
                    fatalError()
                }
            }
        }

        return accepted.map { $0.sum }.reduce(0, +)
    }

    func part2() -> Int {
        return 0
    }
}

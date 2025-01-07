//
// Advent of Code 2023 Day 8 Tests
//

import Testing
@testable import AdventOfCode

@Suite struct Day08Tests {
    let testInput1a = """
RL

AAA = (BBB, CCC)
BBB = (DDD, EEE)
CCC = (ZZZ, GGG)
DDD = (DDD, DDD)
EEE = (EEE, EEE)
GGG = (GGG, GGG)
ZZZ = (ZZZ, ZZZ)
"""

    let testInput1b = """
LLR

AAA = (BBB, BBB)
BBB = (AAA, ZZZ)
ZZZ = (ZZZ, ZZZ)
"""

    let testInput2 = """
LR

11A = (11B, XXX)
11B = (XXX, 11Z)
11Z = (11B, XXX)
22A = (22B, XXX)
22B = (22C, 22C)
22C = (22Z, 22Z)
22Z = (22B, 22B)
XXX = (XXX, XXX)
"""
    @Test func testDay08_part1() throws {
        let day1a = Day08(input: testInput1a)
        #expect(day1a.part1() == 2)

        let day1b = Day08(input: testInput1b)
        #expect(day1b.part1() == 6)
    }

    @Test func testDay08_part1_solution() throws {
        let day = Day08(input: Day08.input) 
        #expect(day.part1() == 19637)
    }

    @Test func testDay08_part2() throws {
        let day = Day08(input: testInput2)
        #expect(day.part2() == 6)
    }

    @Test func testDay08_part2_solution() throws {
        let day = Day08(input: Day08.input) 
        #expect(day.part2() == 8811050362409)
    }
}

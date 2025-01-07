//
// Advent of Code 2023 Day 20 Tests
//

import Testing
@testable import AdventOfCode

@Suite struct Day20Tests {
    let testInput1 = """
broadcaster -> a, b, c
%a -> b
%b -> c
%c -> inv
&inv -> a
"""
    let testInput2 = """
broadcaster -> a
%a -> inv, con
&inv -> b
%b -> con
&con -> output
"""

    @Test func testDay20_part1() throws {
        let day1 = Day20(input: testInput1)
        #expect(day1.part1() == 32000000)

        let day2 = Day20(input: testInput2)
        #expect(day2.part1() == 11687500)
    }

    @Test func testDay20_part1_solution() throws {
        let day = Day20(input: Day20.input) 
        #expect(day.part1() == 879834312)
    }

    @Test func testDay20_part2_solution() throws {
        let day = Day20(input: Day20.input) 
        #expect(day.part2() == 243037165713371)
    }
}

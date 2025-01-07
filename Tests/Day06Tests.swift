//
// Advent of Code 2023 Day 6 Tests
//

import Testing
@testable import AdventOfCode

@Suite struct Day06Tests {
    let testInput = """
Time:      7  15   30
Distance:  9  40  200
"""

    @Test func testDay06_part1() throws {
        let day = Day06(input: testInput) 
        #expect(day.part1() == 288)
    }

    @Test func testDay06_part1_solution() throws {
        let day = Day06(input: Day06.input) 
        #expect(day.part1() == 1710720)
    }

    @Test func testDay06_part2() throws {
        let day = Day06(input: testInput)
        #expect(day.part2() == 71503)
    }

    @Test func testDay06_part2_solution() throws {
        let day = Day06(input: Day06.input) 
        #expect(day.part2() == 35349468)
    }
}

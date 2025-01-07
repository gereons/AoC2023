//
// Advent of Code 2023 Day 24 Tests
//

import Testing
@testable import AdventOfCode

@Suite struct Day24Tests {
    let testInput = """
19, 13, 30 @ -2,  1, -2
18, 19, 22 @ -1, -1, -2
20, 25, 34 @ -2, -2, -4
12, 31, 28 @ -1, -2, -1
20, 19, 15 @  1, -5, -3
"""

    @Test func testDay24_part1() throws {
        let day = Day24(input: testInput, range: 7.0 ... 27.0) 
        #expect(day.part1() == 2)
    }

    @Test func testDay24_part1_solution() throws {
        let day = Day24(input: Day24.input) 
        #expect(day.part1() == 26657)
    }

    @Test func testDay24_part2_solution() throws {
        let day = Day24(input: Day24.input) 
        #expect(day.part2() == 828418331313365)
    }
}

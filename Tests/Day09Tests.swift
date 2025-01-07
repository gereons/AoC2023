//
// Advent of Code 2023 Day 9 Tests
//

import Testing
@testable import AdventOfCode

@Suite struct Day09Tests {
    let testInput = """
0 3 6 9 12 15
1 3 6 10 15 21
10 13 16 21 30 45
"""

    @Test func testDay09_part1() throws {
        let day = Day09(input: testInput) 
        #expect(day.part1() == 114)
    }

    @Test func testDay09_part1_solution() throws {
        let day = Day09(input: Day09.input) 
        #expect(day.part1() == 1842168671)
    }

    @Test func testDay09_part2() throws {
        let day = Day09(input: testInput)
        #expect(day.part2() == 2)
    }

    @Test func testDay09_part2_solution() throws {
        let day = Day09(input: Day09.input) 
        #expect(day.part2() == 903)
    }
}

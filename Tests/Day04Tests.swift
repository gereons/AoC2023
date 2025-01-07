//
// Advent of Code 2023 Day 4 Tests
//

import Testing
@testable import AdventOfCode

@Suite struct Day04Tests {
    let testInput = """
Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11
"""

    @Test func testDay04_part1() throws {
        let day = Day04(input: testInput) 
        #expect(day.part1() == 13)
    }

    @Test func testDay04_part1_solution() throws {
        let day = Day04(input: Day04.input) 
        #expect(day.part1() == 21138)
    }

    @Test func testDay04_part2() throws {
        let day = Day04(input: testInput)
        #expect(day.part2() == 30)
    }

    @Test func testDay04_part2_solution() throws {
        let day = Day04(input: Day04.input) 
        #expect(day.part2() == 7185540)
    }
}

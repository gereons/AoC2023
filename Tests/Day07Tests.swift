//
// Advent of Code 2023 Day 7 Tests
//

import Testing
@testable import AdventOfCode

@Suite struct Day07Tests {
    let testInput = """
32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483
"""

    @Test func testDay07_part1() throws {
        let day = Day07(input: testInput)
        #expect(day.part1() == 6440)
    }

    @Test func testDay07_part1_solution() throws {
        let day = Day07(input: Day07.input)
        #expect(day.part1() == 250898830)
    }

    @Test func testDay07_part2() throws {
        let day = Day07(input: testInput)
        #expect(day.part2() == 5905)
    }

    @Test func testDay07_part2_solution() throws {
        let day = Day07(input: Day07.input)
        #expect(day.part2() == 252127335)
    }
}

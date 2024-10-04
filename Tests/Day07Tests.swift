//
// Advent of Code 2023 Day 7 Tests
//

import XCTest
@testable import AdventOfCode

@MainActor
final class Day07Tests: XCTestCase {
    let testInput = """
32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483
"""

    func testDay07_part1() throws {
        let day = Day07(input: testInput)
        XCTAssertEqual(day.part1(), 6440)
    }

    func testDay07_part1_solution() throws {
        let day = Day07(input: Day07.input)
        XCTAssertEqual(day.part1(), 250898830)
    }

    func testDay07_part2() throws {
        let day = Day07(input: testInput)
        XCTAssertEqual(day.part2(), 5905)
    }

    func testDay07_part2_solution() throws {
        let day = Day07(input: Day07.input)
        XCTAssertEqual(day.part2(), 252127335)
    }
}

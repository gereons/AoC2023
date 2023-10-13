//
// Advent of Code 2023 Day 7 Tests
//

import XCTest
@testable import AdventOfCode

final class Day07Tests: XCTestCase {
    let testInput = """
"""

    func testDay07_part1() throws {
        let day = Day07(input: testInput) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay07_part1_solution() throws {
        let day = Day07(input: Day07.input) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay07_part2() throws {
        let day = Day07(input: testInput)
        XCTAssertEqual(day.part2(), 0)
    }

    func testDay07_part2_solution() throws {
        let day = Day07(input: Day07.input) 
        XCTAssertEqual(day.part2(), 0)
    }
}

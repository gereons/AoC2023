//
// Advent of Code 2023 Day 6 Tests
//

import XCTest
@testable import AdventOfCode

@MainActor
final class Day06Tests: XCTestCase {
    let testInput = """
Time:      7  15   30
Distance:  9  40  200
"""

    func testDay06_part1() throws {
        let day = Day06(input: testInput) 
        XCTAssertEqual(day.part1(), 288)
    }

    func testDay06_part1_solution() throws {
        let day = Day06(input: Day06.input) 
        XCTAssertEqual(day.part1(), 1710720)
    }

    func testDay06_part2() throws {
        let day = Day06(input: testInput)
        XCTAssertEqual(day.part2(), 71503)
    }

    func testDay06_part2_solution() throws {
        let day = Day06(input: Day06.input) 
        XCTAssertEqual(day.part2(), 35349468)
    }
}

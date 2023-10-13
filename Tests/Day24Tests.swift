//
// Advent of Code 2023 Day 24 Tests
//

import XCTest
@testable import AdventOfCode

final class Day24Tests: XCTestCase {
    let testInput = """
"""

    func testDay24_part1() throws {
        let day = Day24(input: testInput) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay24_part1_solution() throws {
        let day = Day24(input: Day24.input) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay24_part2() throws {
        let day = Day24(input: testInput)
        XCTAssertEqual(day.part2(), 0)
    }

    func testDay24_part2_solution() throws {
        let day = Day24(input: Day24.input) 
        XCTAssertEqual(day.part2(), 0)
    }
}

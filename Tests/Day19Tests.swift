//
// Advent of Code 2023 Day 19 Tests
//

import XCTest
@testable import AdventOfCode

final class Day19Tests: XCTestCase {
    let testInput = """
"""

    func testDay19_part1() throws {
        let day = Day19(input: testInput) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay19_part1_solution() throws {
        let day = Day19(input: Day19.input) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay19_part2() throws {
        let day = Day19(input: testInput)
        XCTAssertEqual(day.part2(), 0)
    }

    func testDay19_part2_solution() throws {
        let day = Day19(input: Day19.input) 
        XCTAssertEqual(day.part2(), 0)
    }
}

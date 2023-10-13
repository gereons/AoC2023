//
// Advent of Code 2023 Day 6 Tests
//

import XCTest
@testable import AdventOfCode

final class Day06Tests: XCTestCase {
    let testInput = """
"""

    func testDay06_part1() throws {
        let day = Day06(input: testInput) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay06_part1_solution() throws {
        let day = Day06(input: Day06.input) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay06_part2() throws {
        let day = Day06(input: testInput)
        XCTAssertEqual(day.part2(), 0)
    }

    func testDay06_part2_solution() throws {
        let day = Day06(input: Day06.input) 
        XCTAssertEqual(day.part2(), 0)
    }
}

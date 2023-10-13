//
// Advent of Code 2023 Day 18 Tests
//

import XCTest
@testable import AdventOfCode

final class Day18Tests: XCTestCase {
    let testInput = """
"""

    func testDay18_part1() throws {
        let day = Day18(input: testInput) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay18_part1_solution() throws {
        let day = Day18(input: Day18.input) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay18_part2() throws {
        let day = Day18(input: testInput)
        XCTAssertEqual(day.part2(), 0)
    }

    func testDay18_part2_solution() throws {
        let day = Day18(input: Day18.input) 
        XCTAssertEqual(day.part2(), 0)
    }
}

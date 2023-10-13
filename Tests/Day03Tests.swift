//
// Advent of Code 2023 Day 3 Tests
//

import XCTest
@testable import AdventOfCode

final class Day03Tests: XCTestCase {
    let testInput = """
"""

    func testDay03_part1() throws {
        let day = Day03(input: testInput) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay03_part1_solution() throws {
        let day = Day03(input: Day03.input) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay03_part2() throws {
        let day = Day03(input: testInput)
        XCTAssertEqual(day.part2(), 0)
    }

    func testDay03_part2_solution() throws {
        let day = Day03(input: Day03.input) 
        XCTAssertEqual(day.part2(), 0)
    }
}

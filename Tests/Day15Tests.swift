//
// Advent of Code 2023 Day 15 Tests
//

import XCTest
@testable import AdventOfCode

final class Day15Tests: XCTestCase {
    let testInput = """
"""

    func testDay15_part1() throws {
        let day = Day15(input: testInput) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay15_part1_solution() throws {
        let day = Day15(input: Day15.input) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay15_part2() throws {
        let day = Day15(input: testInput)
        XCTAssertEqual(day.part2(), 0)
    }

    func testDay15_part2_solution() throws {
        let day = Day15(input: Day15.input) 
        XCTAssertEqual(day.part2(), 0)
    }
}

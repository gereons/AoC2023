//
// Advent of Code 2023 Day 10 Tests
//

import XCTest
@testable import AdventOfCode

final class Day10Tests: XCTestCase {
    let testInput = """
"""

    func testDay10_part1() throws {
        let day = Day10(input: testInput) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay10_part1_solution() throws {
        let day = Day10(input: Day10.input) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay10_part2() throws {
        let day = Day10(input: testInput)
        XCTAssertEqual(day.part2(), 0)
    }

    func testDay10_part2_solution() throws {
        let day = Day10(input: Day10.input) 
        XCTAssertEqual(day.part2(), 0)
    }
}

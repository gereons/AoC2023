//
// Advent of Code 2023 Day 17 Tests
//

import XCTest
@testable import AdventOfCode

final class Day17Tests: XCTestCase {
    let testInput = """
"""

    func testDay17_part1() throws {
        let day = Day17(input: testInput) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay17_part1_solution() throws {
        let day = Day17(input: Day17.input) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay17_part2() throws {
        let day = Day17(input: testInput)
        XCTAssertEqual(day.part2(), 0)
    }

    func testDay17_part2_solution() throws {
        let day = Day17(input: Day17.input) 
        XCTAssertEqual(day.part2(), 0)
    }
}

//
// Advent of Code 2023 Day 20 Tests
//

import XCTest
@testable import AdventOfCode

final class Day20Tests: XCTestCase {
    let testInput = """
"""

    func testDay20_part1() throws {
        let day = Day20(input: testInput) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay20_part1_solution() throws {
        let day = Day20(input: Day20.input) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay20_part2() throws {
        let day = Day20(input: testInput)
        XCTAssertEqual(day.part2(), 0)
    }

    func testDay20_part2_solution() throws {
        let day = Day20(input: Day20.input) 
        XCTAssertEqual(day.part2(), 0)
    }
}

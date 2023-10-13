//
// Advent of Code 2023 Day 2 Tests
//

import XCTest
@testable import AdventOfCode

final class Day02Tests: XCTestCase {
    let testInput = """
"""

    func testDay02_part1() throws {
        let day = Day02(input: testInput) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay02_part1_solution() throws {
        let day = Day02(input: Day02.input) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay02_part2() throws {
        let day = Day02(input: testInput)
        XCTAssertEqual(day.part2(), 0)
    }

    func testDay02_part2_solution() throws {
        let day = Day02(input: Day02.input) 
        XCTAssertEqual(day.part2(), 0)
    }
}

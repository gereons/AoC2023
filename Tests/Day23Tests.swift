//
// Advent of Code 2023 Day 23 Tests
//

import XCTest
@testable import AdventOfCode

final class Day23Tests: XCTestCase {
    let testInput = """
"""

    func testDay23_part1() throws {
        let day = Day23(input: testInput) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay23_part1_solution() throws {
        let day = Day23(input: Day23.input) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay23_part2() throws {
        let day = Day23(input: testInput)
        XCTAssertEqual(day.part2(), 0)
    }

    func testDay23_part2_solution() throws {
        let day = Day23(input: Day23.input) 
        XCTAssertEqual(day.part2(), 0)
    }
}

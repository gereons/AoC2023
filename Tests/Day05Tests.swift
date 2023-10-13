//
// Advent of Code 2023 Day 5 Tests
//

import XCTest
@testable import AdventOfCode

final class Day05Tests: XCTestCase {
    let testInput = """
"""

    func testDay05_part1() throws {
        let day = Day05(input: testInput) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay05_part1_solution() throws {
        let day = Day05(input: Day05.input) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay05_part2() throws {
        let day = Day05(input: testInput)
        XCTAssertEqual(day.part2(), 0)
    }

    func testDay05_part2_solution() throws {
        let day = Day05(input: Day05.input) 
        XCTAssertEqual(day.part2(), 0)
    }
}

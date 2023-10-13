//
// Advent of Code 2023 Day 9 Tests
//

import XCTest
@testable import AdventOfCode

final class Day09Tests: XCTestCase {
    let testInput = """
"""

    func testDay09_part1() throws {
        let day = Day09(input: testInput) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay09_part1_solution() throws {
        let day = Day09(input: Day09.input) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay09_part2() throws {
        let day = Day09(input: testInput)
        XCTAssertEqual(day.part2(), 0)
    }

    func testDay09_part2_solution() throws {
        let day = Day09(input: Day09.input) 
        XCTAssertEqual(day.part2(), 0)
    }
}

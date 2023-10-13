//
// Advent of Code 2023 Day 4 Tests
//

import XCTest
@testable import AdventOfCode

final class Day04Tests: XCTestCase {
    let testInput = """
"""

    func testDay04_part1() throws {
        let day = Day04(input: testInput) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay04_part1_solution() throws {
        let day = Day04(input: Day04.input) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay04_part2() throws {
        let day = Day04(input: testInput)
        XCTAssertEqual(day.part2(), 0)
    }

    func testDay04_part2_solution() throws {
        let day = Day04(input: Day04.input) 
        XCTAssertEqual(day.part2(), 0)
    }
}

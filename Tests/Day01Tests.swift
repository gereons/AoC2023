//
// Advent of Code 2023 Day 1 Tests
//

import XCTest
@testable import AdventOfCode

final class Day01Tests: XCTestCase {
    let testInput = """
"""

    func testDay01_part1() throws {
        let day = Day01(input: testInput) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay01_part1_solution() throws {
        let day = Day01(input: Day01.input) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay01_part2() throws {
        let day = Day01(input: testInput)
        XCTAssertEqual(day.part2(), 0)
    }

    func testDay01_part2_solution() throws {
        let day = Day01(input: Day01.input) 
        XCTAssertEqual(day.part2(), 0)
    }
}

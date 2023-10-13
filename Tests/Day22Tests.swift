//
// Advent of Code 2023 Day 22 Tests
//

import XCTest
@testable import AdventOfCode

final class Day22Tests: XCTestCase {
    let testInput = """
"""

    func testDay22_part1() throws {
        let day = Day22(input: testInput) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay22_part1_solution() throws {
        let day = Day22(input: Day22.input) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay22_part2() throws {
        let day = Day22(input: testInput)
        XCTAssertEqual(day.part2(), 0)
    }

    func testDay22_part2_solution() throws {
        let day = Day22(input: Day22.input) 
        XCTAssertEqual(day.part2(), 0)
    }
}

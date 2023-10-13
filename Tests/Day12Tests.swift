//
// Advent of Code 2023 Day 12 Tests
//

import XCTest
@testable import AdventOfCode

final class Day12Tests: XCTestCase {
    let testInput = """
"""

    func testDay12_part1() throws {
        let day = Day12(input: testInput) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay12_part1_solution() throws {
        let day = Day12(input: Day12.input) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay12_part2() throws {
        let day = Day12(input: testInput)
        XCTAssertEqual(day.part2(), 0)
    }

    func testDay12_part2_solution() throws {
        let day = Day12(input: Day12.input) 
        XCTAssertEqual(day.part2(), 0)
    }
}

//
// Advent of Code 2023 Day 25 Tests
//

import XCTest
@testable import AdventOfCode

final class Day25Tests: XCTestCase {
    let testInput = """
"""

    func testDay25_part1() throws {
        let day = Day25(input: testInput) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay25_part1_solution() throws {
        let day = Day25(input: Day25.input) 
        XCTAssertEqual(day.part1(), 0)
    }

    func testDay25_part2() throws {
        let day = Day25(input: testInput)
        XCTAssertEqual(day.part2(), 0)
    }

    func testDay25_part2_solution() throws {
        let day = Day25(input: Day25.input) 
        XCTAssertEqual(day.part2(), 0)
    }
}

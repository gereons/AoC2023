//
// Advent of Code 2023 Day 24 Tests
//

import XCTest
@testable import AdventOfCode

final class Day24Tests: XCTestCase {
    let testInput = """
19, 13, 30 @ -2,  1, -2
18, 19, 22 @ -1, -1, -2
20, 25, 34 @ -2, -2, -4
12, 31, 28 @ -1, -2, -1
20, 19, 15 @  1, -5, -3
"""

    func testDay24_part1() throws {
        let day = Day24(input: testInput, range: 7.0 ... 27.0) 
        XCTAssertEqual(day.part1(), 2)
    }

    func testDay24_part1_solution() throws {
        let day = Day24(input: Day24.input) 
        XCTAssertEqual(day.part1(), 26657)
    }

    func testDay24_part2_solution() throws {
        let day = Day24(input: Day24.input) 
        XCTAssertEqual(day.part2(), 0)
    }
}

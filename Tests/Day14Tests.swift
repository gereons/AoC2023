//
// Advent of Code 2023 Day 14 Tests
//

import XCTest
@testable import AdventOfCode

final class Day14Tests: XCTestCase {
    let testInput = """
OOOO.#.O..
OO..#....#
OO..O##..O
O..#.OO...
........#.
..#....#.#
..O..#.O.O
..O.......
#....###..
#....#....
"""

    func testDay14_part1() throws {
        let day = Day14(input: testInput) 
        XCTAssertEqual(day.part1(), 136)
    }

    func testDay14_part1_solution() throws {
        let day = Day14(input: Day14.input) 
        XCTAssertEqual(day.part1(), 106997)
    }

    func testDay14_part2() throws {
        let day = Day14(input: testInput)
        XCTAssertEqual(day.part2(), 0)
    }

    func testDay14_part2_solution() throws {
        let day = Day14(input: Day14.input) 
        XCTAssertEqual(day.part2(), 0)
    }
}

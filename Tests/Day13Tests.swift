//
// Advent of Code 2023 Day 13 Tests
//

import XCTest
@testable import AdventOfCode

final class Day13Tests: XCTestCase {
    let testInput = """
#.##..##.
..#.##.#.
##......#
##......#
..#.##.#.
..##..##.
#.#.##.#.

#...##..#
#....#..#
..##..###
#####.##.
#####.##.
..##..###
#....#..#
"""

    func testDay13_part1() throws {
        let day = Day13(input: testInput) 
        XCTAssertEqual(day.part1(), 405)
    }

    func testDay13_part1_solution() throws {
        let day = Day13(input: Day13.input) 
        XCTAssertEqual(day.part1(), 34772)
    }

    func testDay13_part2() throws {
        let day = Day13(input: testInput)
        XCTAssertEqual(day.part2(), 0)
    }

    func testDay13_part2_solution() throws {
        let day = Day13(input: Day13.input) 
        XCTAssertEqual(day.part2(), 0)
    }
}

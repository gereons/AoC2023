//
// Advent of Code 2023 Day 3 Tests
//

import XCTest
@testable import AdventOfCode

final class Day03Tests: XCTestCase {
    let testInput = """
467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..
"""

    func testDay03_part1() throws {
        let day = Day03(input: testInput) 
        XCTAssertEqual(day.part1(), 4361)
    }

    func testDay03_part1_solution() throws {
        let day = Day03(input: Day03.input) 
        XCTAssertEqual(day.part1(), 557705)
    }

    func testDay03_part2() throws {
        let day = Day03(input: testInput)
        XCTAssertEqual(day.part2(), 467835)
    }

    func testDay03_part2_solution() throws {
        let day = Day03(input: Day03.input) 
        XCTAssertEqual(day.part2(), 84266818)
    }
}

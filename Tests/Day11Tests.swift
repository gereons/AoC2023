//
// Advent of Code 2023 Day 11 Tests
//

import XCTest
@testable import AdventOfCode

final class Day11Tests: XCTestCase {
    let testInput = """
...#......
.......#..
#.........
..........
......#...
.#........
.........#
..........
.......#..
#...#.....
"""

    func testDay11_part1() throws {
        let day = Day11(input: testInput) 
        XCTAssertEqual(day.part1(), 374)
    }

    func testDay11_part1_solution() throws {
        let day = Day11(input: Day11.input) 
        XCTAssertEqual(day.part1(), 9233514)
    }

    func testDay11_part2() throws {
        let day = Day11(input: testInput)
        XCTAssertEqual(day.distanceSum(day.galaxies, growth: 10), 1030)
        XCTAssertEqual(day.distanceSum(day.galaxies, growth: 100), 8410)
        XCTAssertEqual(day.part2(), 82000210)
    }

    func testDay11_part2_solution() throws {
        let day = Day11(input: Day11.input) 
        XCTAssertEqual(day.part2(), 363293506944)
    }
}

//
// Advent of Code 2023 Day 21 Tests
//

import XCTest
@testable import AdventOfCode

final class Day21Tests: XCTestCase {
    let testInput = """
...........
.....###.#.
.###.##..#.
..#.#...#..
....#.#....
.##..S####.
.##..#...#.
.......##..
.##.#.####.
.##..##.##.
...........
"""

    func testDay21_part1() throws {
        let day = Day21(input: testInput, maxSteps: 6) 
        XCTAssertEqual(day.part1(), 16)
    }

    func testDay21_part1_solution() throws {
        let day = Day21(input: Day21.input) 
        XCTAssertEqual(day.part1(), 3722)
    }

    func testDay21_part2() throws {
        let day = Day21(input: testInput)
        XCTAssertEqual(day.part2(), 0)
    }

    func testDay21_part2_solution() throws {
        let day = Day21(input: Day21.input) 
        XCTAssertEqual(day.part2(), 0)
    }
}

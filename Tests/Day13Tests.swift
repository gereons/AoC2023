//
// Advent of Code 2023 Day 13 Tests
//

import XCTest
@testable import AdventOfCode

@MainActor
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

    let testInput2 = """
....###...#..##
#..####..##..##
.###..###.#.###
...####...#####
#..#..#..##..##
#.##..##.#.....
#........#.##..
"""

    let x = """
.#..###
..#....
..#..#.
.#####.
##.#...
##.#...
######.
..#..#.
..#....
.#..###
#####..
...#..#
..##..#
#####..
#####..
"""

    let redditSamples = """
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

.#.##.#.#
.##..##..
.#.##.#..
#......##
#......##
.#.##.#..
.##..##.#

#..#....#
###..##..
.##.#####
.##.#####
###..##..
#..#....#
#..##...#
"""

    func testDay13_RedditSamples() throws {
        let day = Day13(input: redditSamples)
        XCTAssertEqual(day.part1(), 709)
        XCTAssertEqual(day.part2(), 1400)
    }

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
        XCTAssertEqual(day.part2(), 400)
    }

    func testDay13_part2_solution() throws {
        let day = Day13(input: Day13.input) 
        XCTAssertEqual(day.part2(), 35554)
    }
}

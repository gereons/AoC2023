//
// Advent of Code 2023 Day 13 Tests
//

import Testing
@testable import AdventOfCode

@Suite struct Day13Tests {
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

    @Test func testDay13_RedditSamples() throws {
        let day = Day13(input: redditSamples)
        #expect(day.part1() == 709)
        #expect(day.part2() == 1400)
    }

    @Test func testDay13_part1() throws {
        let day = Day13(input: testInput)
        #expect(day.part1() == 405)
    }

    @Test func testDay13_part1_solution() throws {
        let day = Day13(input: Day13.input) 
        #expect(day.part1() == 34772)
    }

    @Test func testDay13_part2() throws {
        let day = Day13(input: testInput)
        #expect(day.part2() == 400)
    }

    @Test func testDay13_part2_solution() throws {
        let day = Day13(input: Day13.input) 
        #expect(day.part2() == 35554)
    }
}

//
// Advent of Code 2023 Day 14 Tests
//

import Testing
@testable import AdventOfCode

@Suite struct Day14Tests {
    let testInput = """
O....#....
O.OO#....#
.....##...
OO.#O....O
.O.....O#.
O.#..O.#.#
..O..#O..O
.......O..
#....###..
#OO..#....
"""

    @Test func testDay14_part1() throws {
        let day = Day14(input: testInput) 
        #expect(day.part1() == 136)
    }

    @Test func testDay14_part1_solution() throws {
        let day = Day14(input: Day14.input) 
        #expect(day.part1() == 106997)
    }

    @Test func testDay14_part2() throws {
        let day = Day14(input: testInput)
        #expect(day.part2() == 64)
    }

    @Test func testDay14_part2_solution() throws {
        let day = Day14(input: Day14.input) 
        #expect(day.part2() == 99641)
    }
}

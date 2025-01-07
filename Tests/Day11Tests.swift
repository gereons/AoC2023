//
// Advent of Code 2023 Day 11 Tests
//

import Testing
@testable import AdventOfCode

@Suite struct Day11Tests {
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

    @Test func testDay11_part1() throws {
        let day = Day11(input: testInput) 
        #expect(day.part1() == 374)
    }

    @Test func testDay11_part1_solution() throws {
        let day = Day11(input: Day11.input) 
        #expect(day.part1() == 9233514)
    }

    @Test func testDay11_part2() throws {
        let day = Day11(input: testInput)
        #expect(day.distanceSum(day.galaxies, growth: 10) == 1030)
        #expect(day.distanceSum(day.galaxies, growth: 100) == 8410)
        #expect(day.part2() == 82000210)
    }

    @Test func testDay11_part2_solution() throws {
        let day = Day11(input: Day11.input) 
        #expect(day.part2() == 363293506944)
    }
}

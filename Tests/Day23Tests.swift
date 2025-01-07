//
// Advent of Code 2023 Day 23 Tests
//

import Testing
@testable import AdventOfCode

@Suite struct Day23Tests {
    let testInput = """
#.#####################
#.......#########...###
#######.#########.#.###
###.....#.>.>.###.#.###
###v#####.#v#.###.#.###
###.>...#.#.#.....#...#
###v###.#.#.#########.#
###...#.#.#.......#...#
#####.#.#.#######.#.###
#.....#.#.#.......#...#
#.#####.#.#.#########v#
#.#...#...#...###...>.#
#.#.#v#######v###.###v#
#...#.>.#...>.>.#.###.#
#####v#.#.###v#.#.###.#
#.....#...#...#.#.#...#
#.#########.###.#.#.###
#...###...#...#...#.###
###.###.#.###v#####v###
#...#...#.#.>.>.#.>.###
#.###.###.#.###.#.#v###
#.....###...###...#...#
#####################.#
"""

    @Test func testDay23_part1() throws {
        let day = Day23(input: testInput) 
        #expect(day.part1() == 94)
    }

    @Test func testDay23_part1_solution() throws {
        let day = Day23(input: Day23.input) 
        #expect(day.part1() == 1998)
    }

    @Test func testDay23_part2() throws {
        let day = Day23(input: testInput)
        #expect(day.part2() == 154)
    }

    @Test func testDay23_part2_solution() throws {
        let day = Day23(input: Day23.input) 
        #expect(day.part2() == 6434)
    }
}

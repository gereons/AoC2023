//
// Advent of Code 2023 Day 3 Tests
//

import Testing
@testable import AdventOfCode

@Suite struct Day03Tests {
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

    @Test func testDay03_part1() throws {
        let day = Day03(input: testInput) 
        #expect(day.part1() == 4361)
    }

    @Test func testDay03_part1_solution() throws {
        let day = Day03(input: Day03.input) 
        #expect(day.part1() == 557705)
    }

    @Test func testDay03_part2() throws {
        let day = Day03(input: testInput)
        #expect(day.part2() == 467835)
    }

    @Test func testDay03_part2_solution() throws {
        let day = Day03(input: Day03.input) 
        #expect(day.part2() == 84266818)
    }
}

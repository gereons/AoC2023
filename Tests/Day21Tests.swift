//
// Advent of Code 2023 Day 21 Tests
//

import Testing
@testable import AdventOfCode

@Suite struct Day21Tests {
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

    @Test func testDay21_part1() throws {
        let day = Day21(input: testInput, maxSteps: 6) 
        #expect(day.part1() == 16)
    }

    @Test func testDay21_part1_solution() throws {
        let day = Day21(input: Day21.input) 
        #expect(day.part1() == 3722)
    }

    @Test func testDay21_infiniteGrid() throws {
        var day: Day21
        day = Day21(input: testInput, maxSteps: 10)
        #expect(day.part1() == 50)

        day = Day21(input: testInput, maxSteps: 50)
        #expect(day.part1() == 1594)

        day = Day21(input: testInput, maxSteps: 100)
        #expect(day.part1() == 6536)
    }

    @Test func testDay21_part2_solution() throws {
        let day = Day21(input: Day21.input) 
        #expect(day.part2() == 614864614526014)
    }
}

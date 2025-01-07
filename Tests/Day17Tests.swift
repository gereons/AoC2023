//
// Advent of Code 2023 Day 17 Tests
//

import Testing
@testable import AdventOfCode

@Suite struct Day17Tests {
    let testInput = """
2413432311323
3215453535623
3255245654254
3446585845452
4546657867536
1438598798454
4457876987766
3637877979653
4654967986887
4564679986453
1224686865563
2546548887735
4322674655533
"""

    let testInput2 = """
111111111111
999999999991
999999999991
999999999991
999999999991
"""

    @Test func testDay17_part1() throws {
        let day = Day17(input: testInput) 
        #expect(day.part1() == 102)
    }

    @Test func testDay17_part1_solution() throws {
        let day = Day17(input: Day17.input) 
        #expect(day.part1() == 1238)
    }

    @Test func testDay17_part2() throws {
        let day1 = Day17(input: testInput)
        #expect(day1.part2() == 94)

        let day2 = Day17(input: testInput2)
        #expect(day2.part2() == 71)
    }

    @Test func testDay17_part2_solution() throws {
        let day = Day17(input: Day17.input) 
        #expect(day.part2() == 1362)
    }
}

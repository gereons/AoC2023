//
// Advent of Code 2023 Day 2 Tests
//

import Testing
@testable import AdventOfCode

@Suite struct Day02Tests {
    let testInput = """
Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
"""

    @Test func testDay02_part1() throws {
        let day = Day02(input: testInput) 
        #expect(day.part1() == 8)
    }

    @Test func testDay02_part1_solution() throws {
        let day = Day02(input: Day02.input) 
        #expect(day.part1() == 2149)
    }

    @Test func testDay02_part2() throws {
        let day = Day02(input: testInput)
        #expect(day.part2() == 2286)
    }

    @Test func testDay02_part2_solution() throws {
        let day = Day02(input: Day02.input) 
        #expect(day.part2() == 71274)
    }
}

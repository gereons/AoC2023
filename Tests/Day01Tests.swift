//
// Advent of Code 2023 Day 1 Tests
//

import Testing
@testable import AdventOfCode

@Suite struct Day01Tests {
    let testInput = """
1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet
"""

    let testInput2 = """
two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen
"""

    @Test func testDay01_part1() throws {
        let day = Day01(input: testInput) 
        #expect(day.part1() == 142)
    }

    @Test func testDay01_part1_solution() throws {
        let day = Day01(input: Day01.input) 
        #expect(day.part1() == 53974)
    }

    @Test func testDay01_part2() throws {
        let day = Day01(input: testInput2)
        #expect(day.part2() == 281)
    }

    @Test func testDay01_part2_solution() throws {
        let day = Day01(input: Day01.input) 
        #expect(day.part2() == 52840)
    }
}

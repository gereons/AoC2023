//
// Advent of Code 2023 Day 1 Tests
//

import XCTest
@testable import AdventOfCode

final class Day01Tests: XCTestCase {
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

    func testDay01_part1() throws {
        let day = Day01(input: testInput) 
        XCTAssertEqual(day.part1(), 142)
    }

    func testDay01_part1_solution() throws {
        let day = Day01(input: Day01.input) 
        XCTAssertEqual(day.part1(), 53974)
    }

    func testDay01_part2() throws {
        let day = Day01(input: testInput2)
        XCTAssertEqual(day.part2(), 281)
    }

    func testDay01_part2_solution() throws {
        let day = Day01(input: Day01.input) 
        XCTAssertEqual(day.part2(), 52840)
    }
}

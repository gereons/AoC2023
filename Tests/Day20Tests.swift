//
// Advent of Code 2023 Day 20 Tests
//

import XCTest
@testable import AdventOfCode

@MainActor
final class Day20Tests: XCTestCase {
    let testInput1 = """
broadcaster -> a, b, c
%a -> b
%b -> c
%c -> inv
&inv -> a
"""
    let testInput2 = """
broadcaster -> a
%a -> inv, con
&inv -> b
%b -> con
&con -> output
"""

    func testDay20_part1() throws {
        let day1 = Day20(input: testInput1)
        XCTAssertEqual(day1.part1(), 32000000)

        let day2 = Day20(input: testInput2)
        XCTAssertEqual(day2.part1(), 11687500)
    }

    func testDay20_part1_solution() throws {
        let day = Day20(input: Day20.input) 
        XCTAssertEqual(day.part1(), 879834312)
    }

    func testDay20_part2_solution() throws {
        let day = Day20(input: Day20.input) 
        XCTAssertEqual(day.part2(), 243037165713371)
    }
}

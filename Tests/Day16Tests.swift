//
// Advent of Code 2023 Day 16 Tests
//

import Testing
@testable import AdventOfCode

@Suite struct Day16Tests {
    let testInput = #"""
.|...\....
|.-.\.....
.....|-...
........|.
..........
.........\
..../.\\..
.-.-/..|..
.|....-|.\
..//.|....
"""#

    @Test func testDay16_part1() throws {
        let day = Day16(input: testInput) 
        #expect(day.part1() == 46)
    }

    @Test func testDay16_part1_solution() throws {
        let day = Day16(input: Day16.input) 
        #expect(day.part1() == 6921)
    }

    @Test func testDay16_part2() throws {
        let day = Day16(input: testInput)
        #expect(day.part2() == 51)
    }

    @Test func testDay16_part2_solution() throws {
        let day = Day16(input: Day16.input) 
        #expect(day.part2() == 7594)
    }
}

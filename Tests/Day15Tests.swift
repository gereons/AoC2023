//
// Advent of Code 2023 Day 15 Tests
//

import Testing
@testable import AdventOfCode

@Suite struct Day15Tests {
    let testInput = """
rn=1,cm-,qp=3,cm=2,qp-,pc=4,ot=9,ab=5,pc-,pc=6,ot=7
"""

    @Test func testDay15_part1() throws {
        let day = Day15(input: testInput) 
        #expect(day.part1() == 1320)
    }

    @Test func testDay15_part1_solution() throws {
        let day = Day15(input: Day15.input) 
        #expect(day.part1() == 507291)
    }

    @Test func testDay15_part2() throws {
        let day = Day15(input: testInput)
        #expect(day.part2() == 145)
    }

    @Test func testDay15_part2_solution() throws {
        let day = Day15(input: Day15.input) 
        #expect(day.part2() == 296921)
    }
}

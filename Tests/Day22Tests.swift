//
// Advent of Code 2023 Day 22 Tests
//

import Testing
@testable import AdventOfCode

@Suite struct Day22Tests {
    let testInput = """
1,0,1~1,2,1
0,0,2~2,0,2
0,2,3~2,2,3
0,0,4~0,2,4
2,0,5~2,2,5
0,1,6~2,1,6
1,1,8~1,1,9
"""

    @Test func testDay22_part1() throws {
        let day = Day22(input: testInput) 
        #expect(day.part1() == 5)
    }

    @Test func testDay22_part1_solution() throws {
        let day = Day22(input: Day22.input) 
        #expect(day.part1() == 428)
    }

    @Test func testDay22_part2() throws {
        let day = Day22(input: testInput)
        #expect(day.part2() == 7)
    }

    @Test func testDay22_part2_solution() throws {
        let day = Day22(input: Day22.input) 
        #expect(day.part2() == 35654)
    }
}

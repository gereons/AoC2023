//
// Advent of Code 2023 Day 12 Tests
//

import Testing
@testable import AdventOfCode

@Suite struct Day12Tests {
    let testInput = """
???.### 1,1,3
.??..??...?##. 1,1,3
?#?#?#?#?#?#?#? 1,3,1,6
????.#...#... 4,1,1
????.######..#####. 1,6,5
?###???????? 3,2,1
"""

    @Test func testDay12_part1() throws {
        let day = Day12(input: testInput) 
        #expect(day.part1() == 21)
    }

    @Test func testDay12_part1_solution() throws {
        let day = Day12(input: Day12.input) 
        #expect(day.part1() == 7674)
    }

    @Test func testDay12_part2() throws {
        let day = Day12(input: testInput)
        #expect(day.part2() == 525152)
    }

    @Test func testDay12_part2_solution() throws {
        let day = Day12(input: Day12.input) 
        #expect(day.part2() == 4443895258186)
    }
}

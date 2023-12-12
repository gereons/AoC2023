//
// Advent of Code 2023 Day 12 Tests
//

import XCTest
@testable import AdventOfCode

final class Day12Tests: XCTestCase {
    let testInput = """
???.### 1,1,3
.??..??...?##. 1,1,3
?#?#?#?#?#?#?#? 1,3,1,6
????.#...#... 4,1,1
????.######..#####. 1,6,5
?###???????? 3,2,1
"""

    func testDay12_part1() throws {
        let day = Day12(input: testInput) 
        XCTAssertEqual(day.part1(), 21)
    }

    func testDay12_part1_solution() throws {
        let day = Day12(input: Day12.input) 
        XCTAssertEqual(day.part1(), 7674)
    }

    func testDay12_part2() throws {
        let day = Day12(input: testInput)
        XCTAssertEqual(day.part2(), 525152)
    }

    func testDay12_part2_solution() throws {
        let day = Day12(input: Day12.input) 
        XCTAssertEqual(day.part2(), 0)
    }
}

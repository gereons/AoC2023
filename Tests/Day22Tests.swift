//
// Advent of Code 2023 Day 22 Tests
//

import XCTest
@testable import AdventOfCode

final class Day22Tests: XCTestCase {
    let testInput = """
1,0,1~1,2,1
0,0,2~2,0,2
0,2,3~2,2,3
0,0,4~0,2,4
2,0,5~2,2,5
0,1,6~2,1,6
1,1,8~1,1,9
"""

    func testDay22_part1() throws {
        let day = Day22(input: testInput) 
        XCTAssertEqual(day.part1(), 5)
    }

    func testDay22_part1_solution() throws {
        let day = Day22(input: Day22.input) 
        XCTAssertEqual(day.part1(), 428)
    }

    func testDay22_part2() throws {
        let day = Day22(input: testInput)
        XCTAssertEqual(day.part2(), 0)
    }

    func testDay22_part2_solution() throws {
        let day = Day22(input: Day22.input) 
        XCTAssertEqual(day.part2(), 0)
    }
}

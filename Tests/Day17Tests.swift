//
// Advent of Code 2023 Day 17 Tests
//

import XCTest
@testable import AdventOfCode

final class Day17Tests: XCTestCase {
    let testInput = """
2413432311323
3215453535623
3255245654254
3446585845452
4546657867536
1438598798454
4457876987766
3637877979653
4654967986887
4564679986453
1224686865563
2546548887735
4322674655533
"""

    let testInput2 = """
111111111111
999999999991
999999999991
999999999991
999999999991
"""

    func testDay17_part1() throws {
        let day = Day17(input: testInput) 
        XCTAssertEqual(day.part1(), 102)
    }

    func testDay17_part1_solution() throws {
        let day = Day17(input: Day17.input) 
        XCTAssertEqual(day.part1(), 1238)
    }

    func testDay17_part2a() throws {
        let day = Day17(input: testInput)
        XCTAssertEqual(day.part2(), 94)
    }

    func testDay17_part2b() throws {
        let day = Day17(input: testInput2)
        XCTAssertEqual(day.part2(), 71)
    }

    func testDay17_part2_solution() throws {
        let day = Day17(input: Day17.input) 
        XCTAssertEqual(day.part2(), 1362)
    }
}

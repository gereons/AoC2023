//
// Advent of Code 2023 Day 25 Tests
//

import XCTest
@testable import AdventOfCode

final class Day25Tests: XCTestCase {
    func testDay25_part1_solution() throws {
        let day = Day25(input: Day25.input) 
        XCTAssertEqual(day.part1(), 567606)
    }
}

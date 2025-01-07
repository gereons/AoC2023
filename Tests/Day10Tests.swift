//
// Advent of Code 2023 Day 10 Tests
//

import Testing
@testable import AdventOfCode

@Suite struct Day10Tests {
    let testInput1a = """
-L|F7
7S-7|
L|7||
-L-J|
L|-JF
"""
    let testInput1b = """
7-F7-
.FJ|7
SJLL7
|F--J
LJ.LJ
"""

    let testInput2a = """
...........
.S-------7.
.|F-----7|.
.||.....||.
.||.....||.
.|L-7.F-J|.
.|..|.|..|.
.L--J.L--J.
...........
"""

    let testInput2b = """
..........
.S------7.
.|F----7|.
.||....||.
.||....||.
.|L-7F-J|.
.|..||..|.
.L--JL--J.
..........
"""

    let testInput2c = """
.F----7F7F7F7F-7....
.|F--7||||||||FJ....
.||.FJ||||||||L7....
FJL7L7LJLJ||LJ.L-7..
L--J.L7...LJS7F-7L7.
....F-J..F7FJ|L7L7L7
....L7.F7||L7|.L7L7|
.....|FJLJ|FJ|F7|.LJ
....FJL-7.||.||||...
....L---J.LJ.LJLJ...
"""

    let testInput2d = """
FF7FSF7F7F7F7F7F---7
L|LJ||||||||||||F--J
FL-7LJLJ||||||LJL-77
F--JF--7||LJLJ7F7FJ-
L---JF-JLJ.||-FJLJJ7
|F|F-JF---7F7-L7L|7|
|FFJF7L7F-JF7|JL---7
7-L-JL7||F7|L7F-7F7|
L.L7LFJ|||||FJL7||LJ
L7JLJL-JLJLJL--JLJ.L
"""

    @Test func testDay10_part1() throws {
        let day1a = Day10(input: testInput1a)
        #expect(day1a.part1() == 4)

        let day1b = Day10(input: testInput1b)
        #expect(day1b.part1() == 8)
    }

    @Test func testDay10_part1_solution() throws {
        let day = Day10(input: Day10.input) 
        #expect(day.part1() == 6838)
    }

    @Test func testDay10_part2() throws {
        let day2a = Day10(input: testInput2a)
        #expect(day2a.part2() == 4)

        let day2b = Day10(input: testInput2b)
        #expect(day2b.part2() == 4)

        let day2c = Day10(input: testInput2c)
        #expect(day2c.part2() == 8)

        let day2d = Day10(input: testInput2d)
        #expect(day2d.part2() == 10)
    }

    @Test func testDay10_part2_solution() throws {
        let day = Day10(input: Day10.input) 
        #expect(day.part2() == 451)
    }
}

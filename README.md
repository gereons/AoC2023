# Advent Of Code 2023

My [AoC 2023](https://adventofcode.com/2023) Solutions in Swift

### Overview

All code for all days is compiled into a single macOS commandline binary, which can be run either from within Xcode or from Terminal.

Each day has at least 3 associated source files: 

* `DayX.swift` for the solution code
* `DayX+Input.swift` for the puzzle input. This file is created by running the included `input.sh` script but is not included in this repo for [legal reasons](https://www.reddit.com/r/adventofcode/wiki/faqs/copyright/inputs).
* `DayXTests.swift` for the test suite, if the puzzle has test cases

`AoC.swift` has the `main()` function which simply runs one (or all) of the puzzles.

The code relies on my own [AoCTools](https://github.com/gereons/AoCTools) package where I started collecting utility functions for things frequently used in AoC, such as 2d and 3d points, hexagonal grids, an A\* pathfinder and more.

### Xcode

Open the project via the `Package.swift` file (`xed .` from Terminal in the project directory). By default, hitting `Cmd-R` will run the puzzle for the current calendar day. To override this, change `defaultDay` in `AoC.swift`.

`Cmd-U` runs the test suite for all 25 days. Run individual tests by clicking on them in the Test Inspector (`Cmd-6`)

### Commandline

From the commandline, use `swift run` or `swift run -c release`. 

To run the puzzle for a specific day without changing `AoC.swift`, use `swift run AdventOfCode X` to run day `X`. `X` can be a number from 1 to 25 or `all`.

To run tests, use `swift test` for all tests, or e.g. `swift test --filter AoCTests.Day02Tests` to run the tests for day 2.

<!--- advent_readme_stars table --->
## 2023 Results

| Day | Part 1 | Part 2 |
| :---: | :---: | :---: |
<!--- advent_readme_stars table --->

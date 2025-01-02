//
// Advent of Code 2023 Day 20
//
// https://adventofcode.com/2023/day/20
//

import AoCTools

private enum Pulse {
    case high, low
}

private struct Message: CustomStringConvertible {
    let pulse: Pulse
    let from: String
    let destination: String

    var description: String {
        "\(from) -\(pulse)-> \(destination)"
    }
}

private class CommunicationsModule {
    let name: String
    let destinations: [String]

    init(name: String, destinations: [String]) {
        self.name = name
        self.destinations = destinations
    }

    func receive(_ pulse: Pulse, from name: String) -> [Message] { [] }

    func reset() {}

    func send(_ pulse: Pulse) -> [Message] {
        destinations.map {
            Message(pulse: pulse, from: self.name, destination: $0)
        }
    }

    static func make(from string: String) -> CommunicationsModule {
        let parts = string.components(separatedBy: " -> ")
        let destinations = parts[1].components(separatedBy: ", ")

        switch parts[0].prefix(1) {
        case "%": return Flipflop(name: String(parts[0].dropFirst(1)), destinations: destinations)
        case "&": return Conjunction(name: String(parts[0].dropFirst(1)), destinations: destinations)
        default: return Broadcaster(name: parts[0], destinations: destinations)
        }
    }
}

private final class Flipflop: CommunicationsModule {
    private var state: Bool = false

    override func reset() {
        state = false
    }

    override func receive(_ pulse: Pulse, from name: String) -> [Message] {
        if pulse == .high {
            return []
        }

        state.toggle()
        return send(state ? .high : .low)
    }
}

private final class Conjunction: CommunicationsModule {
    private var inputs = [String: Pulse]()
    private(set) var triggered = false

    func addInput(_ name: String) {
        inputs[name] = .low
    }

    override func reset() {
        triggered = false
        inputs.keys.forEach {
            inputs[$0] = .low
        }
    }

    override func receive(_ pulse: Pulse, from name: String) -> [Message] {
        inputs[name] = pulse
        var pulse = Pulse.high
        if inputs.values.allSatisfy({ $0 == .high }) {
            pulse = .low
        }
        if !triggered {
            triggered = pulse == .high
        }
        return send(pulse)
    }
}

private final class Broadcaster: CommunicationsModule {
    override func receive(_ pulse: Pulse, from name: String) -> [Message] {
        send(pulse)
    }
}

private final class Output: CommunicationsModule {
    // drop all input pulses
}

final class Day20: AdventOfCodeDay {
    let title = "Pulse Propagation"
    
    private let modules: [String: CommunicationsModule]

    init(input: String) {
        let rawModules = input.lines.map { CommunicationsModule.make(from: $0) }

        let conjunctions = rawModules.compactMap { $0 as? Conjunction }
        for con in conjunctions {
            for module in rawModules {
                if module.destinations.contains(con.name) {
                    con.addInput(module.name)
                }
            }
        }

        var modules = rawModules.mapped(by: \.name)
        for module in rawModules {
            for dest in module.destinations {
                if modules[dest] == nil {
                    modules[dest] = Output(name: dest, destinations: [])
                }
            }
        }
        self.modules = modules
    }

    func part1() -> Int {
        modules.values.forEach { $0.reset() }

        let broadcaster = modules["broadcaster"]!

        var highCount = 0
        var lowCount = 0

        for _ in 0 ..< 1000 {
            lowCount += 1
            var messages = broadcaster.receive(.low, from: "btn")
            lowCount += messages.count

            while !messages.isEmpty {
                var next = [Message]()
                for msg in messages {
                    let msgs = modules[msg.destination]!.receive(msg.pulse, from: msg.from)
                    let high = msgs.filter { $0.pulse == .high }.count
                    highCount += high
                    lowCount += msgs.count - high
                    next.append(contentsOf: msgs)
                }
                messages = next
            }
        }

        return highCount * lowCount
    }

    func part2() -> Int {
        modules.values.forEach { $0.reset() }

        // find the input to rx
        let rxSender = modules.values.first { $0.destinations == ["rx"] }!

        // find its input conjunctions so we can monitor them
        let inputs = modules.values.filter { $0.destinations.contains(rxSender.name) }.compactMap { $0 as? Conjunction }
        var counts = [String: Int]()

        let broadcaster = modules["broadcaster"]!

        for presses in 1 ..< Int.max {
            var messages = broadcaster.receive(.low, from: "btn")

            while !messages.isEmpty {
                var next = [Message]()
                for msg in messages {
                    let msgs = modules[msg.destination]!.receive(msg.pulse, from: msg.from)
                    next.append(contentsOf: msgs)
                    for input in inputs {
                        if input.triggered && counts[input.name] == nil {
                            counts[input.name] = presses
                        }
                    }
                }
                messages = next
            }
            if counts.count == inputs.count {
                break
            }
        }

        return counts.values.reduce(1, *)
    }
}

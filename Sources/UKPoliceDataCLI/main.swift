import ArgumentParser
import Foundation

struct PoliceData: ParsableCommand {

    static let configuration = CommandConfiguration(
        abstract: "A command-line tool for UK Police data.",
        subcommands: [
            PoliceForcesCommand.self,
            NeighbourhoodsCommand.self
        ]
    )

}

PoliceData.main()

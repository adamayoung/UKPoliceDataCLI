import ArgumentParser
import Foundation

struct NeighbourhoodsCommand: ParsableCommand {

    static let configuration = CommandConfiguration(
        commandName: "neighbourhoods",
        abstract: "Information about Neighbourhoods in a Police Force.",
        subcommands: [
            NeighbourhoodListCommand.self,
            NeighbourhoodDetailsCommand.self,
            NeighbourhoodTeamCommand.self
        ],
        defaultSubcommand: NeighbourhoodListCommand.self
    )

}

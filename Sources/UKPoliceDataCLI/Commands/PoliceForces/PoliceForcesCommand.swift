import ArgumentParser
import Foundation

struct PoliceForcesCommand: ParsableCommand {

    static let configuration = CommandConfiguration(
        commandName: "forces",
        abstract: "Information about Police Forces in the UK.",
        subcommands: [
            PoliceForceListCommand.self,
            PoliceForceDetailsCommand.self,
            PoliceForceOfficersCommand.self
        ],
        defaultSubcommand: PoliceForceListCommand.self
    )

}

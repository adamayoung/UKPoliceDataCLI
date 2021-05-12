import ArgumentParser
import Foundation
import SwiftyTextTable
import UKPoliceData

struct PoliceForceDetailsCommand: ParsableCommand {

    static let configuration = CommandConfiguration(
        commandName: "details",
        abstract: "Prints details about a Police Force."
    )

    @Argument(help: "Police Force Identifier")
    var id: String

    private var policeDataAPI: PoliceDataAPI {
        UKPoliceDataAPI.shared
    }

    func run() throws {
        print("")
        defer {
            print("")
        }

        let policeForce = try policeDataAPI.policeForces.fetchDetails(forPoliceForce: id)

        print(policeForce.renderTable(header: policeForce.name))
    }

}

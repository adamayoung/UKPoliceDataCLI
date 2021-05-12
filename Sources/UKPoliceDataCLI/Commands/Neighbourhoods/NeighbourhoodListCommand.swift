import ArgumentParser
import Foundation
import SwiftyTextTable
import UKPoliceData

struct NeighbourhoodListCommand: ParsableCommand {

    static let configuration = CommandConfiguration(
        commandName: "list",
        abstract: "Prints a list of all Neighbourhoods in a Police Force."
    )

    @Argument(help: "Police Force Identifier")
    var policeForceID: String

    private var policeDataAPI: PoliceDataAPI {
        UKPoliceDataAPI.shared
    }

    func run() throws {
        print("")
        defer {
            print("")
        }

        let policeForce = try policeDataAPI.policeForces.fetchDetails(forPoliceForce: policeForceID)
        let neighbourhoods = try policeDataAPI.neighbourhoods.fetchAll(inPoliceForce: policeForceID)

        guard !neighbourhoods.isEmpty else {
            print("No Neighbourhoods found.")
            return
        }

        print(policeForce.name)
        print(neighbourhoods.renderTable(header: "Neighbourhoods"))
    }

}

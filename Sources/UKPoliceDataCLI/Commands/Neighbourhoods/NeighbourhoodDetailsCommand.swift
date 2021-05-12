import ArgumentParser
import Foundation
import SwiftyTextTable
import UKPoliceData

struct NeighbourhoodDetailsCommand: ParsableCommand {

    static let configuration = CommandConfiguration(
        commandName: "details",
        abstract: "Prints details about a Neighbourhood in a Police Force."
    )

    @Option(
        name: [.customShort("f"), .customLong("force")],
        help: "Police Force Identifier"
    )
    var policeForceID: String

    @Argument(help: "Neighbourhood Identifier")
    var id: String

    private var policeDataAPI: PoliceDataAPI {
        UKPoliceDataAPI.shared
    }

    func run() throws {
        print("")
        defer {
            print("")
        }

        let policeForce = try policeDataAPI.policeForces.fetchDetails(forPoliceForce: policeForceID)
        let neighbourhood = try policeDataAPI.neighbourhoods.fetchDetails(forNeighbourhood: id,
                                                                          inPoliceForce: policeForceID)

        print("\(policeForce.name) / Neighbourhood")
        print(neighbourhood.renderTable(header: neighbourhood.name))
    }

}

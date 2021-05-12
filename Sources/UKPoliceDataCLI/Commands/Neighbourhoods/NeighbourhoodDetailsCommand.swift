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

        let policeForce = try policeDataAPI.policeForces.fetchDetails(forPoliceForce: policeForceID)
        let neighbourhood = try policeDataAPI.neighbourhoods.fetchDetails(forNeighbourhood: id,
                                                                          inPoliceForce: policeForceID)

        let fieldColumn = TextTableColumn(header: "Field")
        let valueColumn = TextTableColumn(header: "Value")

        var table = TextTable(columns: [fieldColumn, valueColumn])
        table.header = "\(policeForce.name) / \(neighbourhood.name)"

        table.addRow(values: ["ID", neighbourhood.id])
        table.addRow(values: ["Name", neighbourhood.name])
        table.addRow(values: ["Population", neighbourhood.population])
        table.addRow(values: ["Email", neighbourhood.contactDetails.email ?? ""])
        table.addRow(values: ["Telephone", neighbourhood.contactDetails.telephone ?? ""])
        table.addRow(values: ["Website", neighbourhood.policeForceWebsite])
        if let facebook = neighbourhood.contactDetails.facebook {
            table.addRow(values: ["Facebook", facebook])
        }
        if let twitter = neighbourhood.contactDetails.twitter {
            table.addRow(values: ["Twitter", twitter])
        }
        table.addRow(values: ["Coordinates", neighbourhood.centre])

        print(table.render())
    }

}

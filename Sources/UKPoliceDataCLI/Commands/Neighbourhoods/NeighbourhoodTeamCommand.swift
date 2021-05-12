import ArgumentParser
import Foundation
import SwiftyTextTable
import UKPoliceData

struct NeighbourhoodTeamCommand: ParsableCommand {

    static let configuration = CommandConfiguration(
        commandName: "team",
        abstract: "Prints a list Police Officers in a Police Force's Neighbourhood."
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
        let neightbourhood = try policeDataAPI.neighbourhoods.fetchDetails(forNeighbourhood: id,
                                                                           inPoliceForce: policeForceID)
        let policeOfficers = try policeDataAPI.neighbourhoods.fetchPoliceOfficers(forNeighbourhood: id,
                                                                                  inPoliceForce: policeForceID)

        guard !policeOfficers.isEmpty else {
            print("No Police Officers found.")
            return
        }

        let nameColumn = TextTableColumn(header: "Name")
        let rankColumn = TextTableColumn(header: "Rank")
        let emailColumn = TextTableColumn(header: "Email")
        let telephoneColumn = TextTableColumn(header: "Telephone")

        var table = TextTable(columns: [nameColumn, rankColumn, emailColumn, telephoneColumn])
        table.header = "Senior Officers"

        policeOfficers.forEach { policeOfficer in
            table.addRow(
                values: [
                    policeOfficer.name,
                    policeOfficer.rank,
                    policeOfficer.contactDetails.email ?? "",
                    policeOfficer.contactDetails.telephone ?? ""
                ]
            )
        }

        print("\(policeForce.name) / \(neightbourhood.name)")
        print(table.render())
    }

}

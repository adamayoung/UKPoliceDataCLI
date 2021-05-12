import ArgumentParser
import Foundation
import SwiftyTextTable
import UKPoliceData

struct PoliceForceOfficersCommand: ParsableCommand {

    static let configuration = CommandConfiguration(
        commandName: "officers",
        abstract: "Prints information about a Police Force's Officers."
    )

    @Argument(help: "Police Force Identifier")
    var policeForceID: String

    private var policeDataAPI: PoliceDataAPI {
        UKPoliceDataAPI.shared
    }

    func run() throws {
        print("")

        let policeOfficers = try policeDataAPI.policeForces.fetchSeniorOfficers(forPoliceForce: policeForceID)

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

        print(table.render())
    }

}

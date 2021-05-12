import ArgumentParser
import Foundation
import SwiftyTextTable
import UKPoliceData

struct PoliceForceListCommand: ParsableCommand {

    static let configuration = CommandConfiguration(
        commandName: "list",
        abstract: "Prints a list all Police Forces."
    )

    private var policeDataAPI: PoliceDataAPI {
        UKPoliceDataAPI.shared
    }

    func run() throws {
        print("")

        let policeForces = try policeDataAPI.policeForces.fetchAll()

        let idColumn = TextTableColumn(header: "ID")
        let nameColumn = TextTableColumn(header: "Name")

        var table = TextTable(columns: [idColumn, nameColumn])
        table.header = "UK Police Forces"

        policeForces.forEach { policeForce in
            table.addRow(values: [policeForce.id, policeForce.name])
        }

        print(table.render())
    }

}

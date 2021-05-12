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

        let neightbourhoods = try policeDataAPI.neighbourhoods.fetchAll(inPoliceForce: policeForceID)

        let idColumn = TextTableColumn(header: "ID")
        let nameColumn = TextTableColumn(header: "Name")

        var table = TextTable(columns: [idColumn, nameColumn])
        table.header = "Neighbourhoods"

        neightbourhoods.forEach { neightbourhood in
            table.addRow(values: [neightbourhood.id, neightbourhood.name])
        }

        print(table.render())
    }

}

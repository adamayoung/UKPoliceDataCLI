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

        let policeForce = try policeDataAPI.policeForces.fetchDetails(forPoliceForce: id)

        let fieldColumn = TextTableColumn(header: "Field")
        let valueColumn = TextTableColumn(header: "Value")

        var table = TextTable(columns: [fieldColumn, valueColumn])
        table.header = policeForce.name

        table.addRow(values: ["ID", policeForce.id])
        table.addRow(values: ["Name", policeForce.name])
        table.addRow(values: ["Telephone", policeForce.telephone])
        table.addRow(values: ["Website", policeForce.url])

        print(table.render())
    }

}

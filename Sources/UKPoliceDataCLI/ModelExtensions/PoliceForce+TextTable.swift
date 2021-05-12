import Foundation
import SwiftyTextTable
import UKPoliceData

extension PoliceForce {

    func renderTable(header: String? = nil) -> String {
        let fieldColumn = TextTableColumn(header: "Field")
        let valueColumn = TextTableColumn(header: "Value")

        var table = TextTable(columns: [fieldColumn, valueColumn])
        table.header = header

        table.addRow(values: ["ID", id])
        table.addRow(values: ["Name", name])
        table.addRow(values: ["Telephone", telephone])
        table.addRow(values: ["Website", url])

        return table.render()
    }

}

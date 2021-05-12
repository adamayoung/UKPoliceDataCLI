import Foundation
import SwiftyTextTable
import UKPoliceData

extension Collection where Element == PoliceForceReference {

    func renderTable(header: String? = nil) -> String {
        let idColumn = TextTableColumn(header: "ID")
        let nameColumn = TextTableColumn(header: "Name")

        var table = TextTable(columns: [idColumn, nameColumn])
        table.header = header

        forEach {
            table.addRow(values: [$0.id, $0.name])
        }

        return table.render()
    }

}

import Foundation
import SwiftyTextTable
import UKPoliceData

extension Collection where Element == PoliceOfficer {

    func renderTable(header: String? = nil) -> String {
        let nameColumn = TextTableColumn(header: "Name")
        let rankColumn = TextTableColumn(header: "Rank")
        let emailColumn = TextTableColumn(header: "Email")
        let telephoneColumn = TextTableColumn(header: "Telephone")

        var table = TextTable(columns: [nameColumn, rankColumn, emailColumn, telephoneColumn])
        table.header = header

        forEach {
            table.addRow(
                values: [
                    $0.name,
                    $0.rank,
                    $0.contactDetails.email ?? "",
                    $0.contactDetails.telephone ?? ""
                ]
            )
        }

        return table.render()
    }

}

import Foundation
import SwiftyTextTable
import UKPoliceData

extension Neighbourhood {

    func renderTable(header: String? = nil) -> String {
        let fieldColumn = TextTableColumn(header: "Field")
        let valueColumn = TextTableColumn(header: "Value")

        var table = TextTable(columns: [fieldColumn, valueColumn])
        table.header = header

        table.addRow(values: ["ID", id])
        table.addRow(values: ["Name", name])
        table.addRow(values: ["Population", population])
        table.addRow(values: ["Website", policeForceWebsite])
        table.optionallyAddRow(field: "Email", value: contactDetails.email)
        table.optionallyAddRow(field: "Telephone", value: contactDetails.telephone)
        table.optionallyAddRow(field: "Mobile", value: contactDetails.mobile)
        table.optionallyAddRow(field: "Fax", value: contactDetails.fax)
        table.optionallyAddRow(field: "Web", value: contactDetails.web)
        table.optionallyAddRow(field: "Address",
                               value: contactDetails.address?.replacingOccurrences(of: "\n", with: ", "))
        table.optionallyAddRow(field: "Facebook", value: contactDetails.facebook)
        table.optionallyAddRow(field: "Twitter", value: contactDetails.twitter)
        table.optionallyAddRow(field: "YouTube", value: contactDetails.youtube)
        table.optionallyAddRow(field: "MySpace", value: contactDetails.myspace)
        table.optionallyAddRow(field: "Bebo", value: contactDetails.bebo)
        table.optionallyAddRow(field: "Flickr", value: contactDetails.flickr)
        table.optionallyAddRow(field: "Forum", value: contactDetails.forum)
        table.optionallyAddRow(field: "Blog", value: contactDetails.blog)
        table.optionallyAddRow(field: "RSS", value: contactDetails.rss)
        table.addRow(values: ["Coordinates", centre])

        return table.render()
    }

}

private extension TextTable {

    mutating func optionallyAddRow(field: String, value: CustomStringConvertible?) {
        guard let value = value else {
            return
        }

        addRow(values: [field, value])
    }

}

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

        if let email = contactDetails.email {
            table.addRow(values: ["Email", email])
        }

        if let telephone = contactDetails.telephone {
            table.addRow(values: ["Telephone", telephone])
        }

        if let mobile = contactDetails.mobile {
            table.addRow(values: ["Mobile", mobile])
        }

        if let fax = contactDetails.fax {
            table.addRow(values: ["Fax", fax])
        }

        if let web = contactDetails.web {
            table.addRow(values: ["Web", web])
        }

        if let address = contactDetails.address {
            table.addRow(values: ["Address", address.replacingOccurrences(of: "\n", with: ", ")])
        }

        if let facebook = contactDetails.facebook {
            table.addRow(values: ["Facebook", facebook])
        }

        if let twitter = contactDetails.twitter {
            table.addRow(values: ["Twitter", twitter])
        }

        if let youtube = contactDetails.youtube {
            table.addRow(values: ["YouTube", youtube])
        }

        if let myspace = contactDetails.myspace {
            table.addRow(values: ["MySpace", myspace])
        }

        if let bebo = contactDetails.bebo {
            table.addRow(values: ["Bebo", bebo])
        }

        if let flickr = contactDetails.flickr {
            table.addRow(values: ["Flickr", flickr])
        }

        if let forum = contactDetails.forum {
            table.addRow(values: ["Forum", forum])
        }

        if let blog = contactDetails.blog {
            table.addRow(values: ["Blog", blog])
        }

        if let rss = contactDetails.rss {
            table.addRow(values: ["RSS", rss])
        }

        table.addRow(values: ["Coordinates", centre])

        return table.render()
    }

}

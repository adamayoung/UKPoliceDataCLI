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
        defer {
            print("")
        }

        let policeForces = try policeDataAPI.policeForces.fetchAll()

        print(policeForces.renderTable(header: "UK Police Forces"))
    }

}

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
        defer {
            print("")
        }

        let policeOfficers = try policeDataAPI.policeForces.fetchSeniorOfficers(forPoliceForce: policeForceID)

        guard !policeOfficers.isEmpty else {
            print("No Police Officers found.")
            return
        }

        print(policeOfficers.renderTable(header: "Senior Officers"))
    }

}

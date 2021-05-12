import Foundation
import UKPoliceData

extension PoliceForceService {

    func fetchAll() throws -> [PoliceForceReference] {
        var result: Result<[PoliceForceReference], PoliceDataError>!

        let group = DispatchGroup()

        group.enter()
        fetchAll {
            defer {
                group.leave()
            }

            result = $0
        }

        group.wait()

        return try result.get()
    }

    func fetchDetails(forPoliceForce id: String) throws -> PoliceForce {
        var result: Result<PoliceForce, PoliceDataError>!

        let group = DispatchGroup()

        group.enter()
        fetchDetails(forPoliceForce: id) {
            defer {
                group.leave()
            }

            result = $0
        }

        group.wait()

        return try result.get()
    }

    func fetchSeniorOfficers(forPoliceForce policeForceID: String) throws -> [PoliceOfficer] {
        var result: Result<[PoliceOfficer], PoliceDataError>!

        let group = DispatchGroup()

        group.enter()
        fetchSeniorOfficers(forPoliceForce: policeForceID) {
            defer {
                group.leave()
            }

            result = $0
        }

        group.wait()

        return try result.get()
    }

}

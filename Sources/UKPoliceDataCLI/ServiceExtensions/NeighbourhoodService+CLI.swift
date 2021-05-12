import Foundation
import UKPoliceData

extension NeighbourhoodService {

    func fetchAll(inPoliceForce policeForceID: String) throws -> [NeighbourhoodReference] {
        var result: Result<[NeighbourhoodReference], PoliceDataError>!

        let group = DispatchGroup()

        group.enter()
        UKPoliceDataAPI.shared.neighbourhoods.fetchAll(inPoliceForce: policeForceID) {
            defer {
                group.leave()
            }

            result = $0
        }

        group.wait()

        return try result.get()
    }

    func fetchDetails(forNeighbourhood id: String, inPoliceForce policeForceID: String) throws -> Neighbourhood {
        var result: Result<Neighbourhood, PoliceDataError>!

        let group = DispatchGroup()

        group.enter()
        fetchDetails(forNeighbourhood: id, inPoliceForce: policeForceID) {
            defer {
                group.leave()
            }

            result = $0
        }

        group.wait()

        return try result.get()
    }

    func fetchPoliceOfficers(forNeighbourhood neighbourhoodID: String,
                             inPoliceForce policeForceID: String) throws -> [PoliceOfficer] {
        var result: Result<[PoliceOfficer], PoliceDataError>!

        let group = DispatchGroup()

        group.enter()

        fetchPoliceOfficers(forNeighbourhood: neighbourhoodID, inPoliceForce: policeForceID) {
            defer {
                group.leave()
            }

            result = $0
        }

        group.wait()

        return try result.get()
    }

}

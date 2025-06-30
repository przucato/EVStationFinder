@testable import EV_Station_Finder

class FuelStationFinderServiceMock: FuelStationFinderServiceProtocol {
    var result: Result<[FuelStation], FuelStationFinderError>?

    func fetchStations(zipCode: String, completion: @escaping (Result<[FuelStation], FuelStationFinderError>) -> Void) {
        if let result = result {
            completion(result)
        }
    }
}

protocol FuelStationFinderServiceProtocol {
    func fetchStations(zipCode: String, completion: @escaping (Result<[FuelStation], FuelStationFinderError>) -> Void)
}

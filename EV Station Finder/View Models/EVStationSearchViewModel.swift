import Foundation

class EVStationSearchViewModel: ObservableObject {
    @Published var zipCode: String = ""
    @Published var stations: [FuelStation]?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let service: any FuelStationFinderServiceProtocol
    private(set) var zipCodeValidator: ZipCodeValidatorProtocol
    private let dataPersistenceService: DataPersistenceServiceProtocol
    
    init(service: FuelStationFinderServiceProtocol, zipCodeValidator: ZipCodeValidatorProtocol, dataPersistenceService: DataPersistenceServiceProtocol) {
        self.service = service
        self.zipCodeValidator = zipCodeValidator
        self.dataPersistenceService = dataPersistenceService
    }
    
    func checkForLastSearchedZipCode() {
        zipCode = dataPersistenceService.getLastSearchedZipCode() ?? ""
    }

    func searchButtonTapped() {
        isLoading = true
        errorMessage = nil
        stations = nil
        
        dataPersistenceService.persistLastSearchedZipCode(zipCode)

        fetchStations()
    }
    
    private func fetchStations() {
        service.fetchStations(zipCode: zipCode) { [weak self] result in
            guard let self = self else { return }
            self.isLoading = false

            switch result {
            case .success(let fetchedStations):
                self.stations = fetchedStations
            case .failure(let error):
                self.errorMessage = error.errorDescription
            }
        }
    }
    
    func stationTapped(_ station: FuelStation) {
        
    }
}

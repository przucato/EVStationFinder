@testable import EV_Station_Finder

class DataPersistenceServiceMock: DataPersistenceServiceProtocol {
    var persistedZipCode: String?
    
    func getLastSearchedZipCode() -> String? {
        return persistedZipCode
    }
    
    func persistLastSearchedZipCode(_ zipCode: String) {
        persistedZipCode = zipCode
    }
}

import Foundation

class UserDefaultsPersistenceService: DataPersistenceServiceProtocol {
    private let defaults = UserDefaults.standard
    private let lastZipCodeKey = "lastSearchedZipCode"
    
    func getLastSearchedZipCode() -> String? {
        defaults.string(forKey: lastZipCodeKey)
    }
    
    func persistLastSearchedZipCode(_ zipCode: String) {
        defaults.set(zipCode, forKey: lastZipCodeKey)
    }
}

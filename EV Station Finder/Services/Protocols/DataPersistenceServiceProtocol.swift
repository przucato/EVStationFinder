protocol DataPersistenceServiceProtocol {
    func getLastSearchedZipCode() -> String?
    func persistLastSearchedZipCode(_ zipCode: String)
}

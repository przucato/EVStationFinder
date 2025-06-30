enum FuelStationFinderError: Error {
    case invalidURL
    case decodingError
    case noData
    case unknown
    
    var errorDescription: String? {
            switch self {
            case .noData:
                return "No data was returned from the server."
            case .decodingError:
                return "Failed to process the station data."
            default:
                return "Something went wrong. Please try again."
            }
        }
}

import Foundation

protocol NRELFuelStationFinderProtocol {
    var fuelType: String { get }
    var NRELBaseUrl: String? { get }
    var NRELApiKey: String? { get }
    func getUrl(zipCode: String) -> URL?
}

extension NRELFuelStationFinderProtocol {
    var NRELBaseUrl: String? {
        return Bundle.main.infoDictionary?["NRELBaseUrl"] as? String
    }
    
    var NRELApiKey: String? {
        return Bundle.main.infoDictionary?["NRELApiKey"] as? String
    }
    
    func getUrl(zipCode: String) -> URL? {
        if let baseUrl = NRELBaseUrl, let apiKey = NRELApiKey,
           let url = URL(string: baseUrl + "v1.json?fuel_type=\(fuelType)&zip=\(zipCode)&api_key=\(apiKey)") {
            return url
        }
        return nil
    }
}

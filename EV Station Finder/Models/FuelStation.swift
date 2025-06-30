import Foundation

struct FuelStation: Codable, Identifiable {
    let id = UUID()
    let stationName: String
    let streetAddress: String
    let city: String
    let state: String
    let country: String
    let zip: String
    let latitude: Double
    let longitude: Double
    let fuelTypeCode: String
    let evConnectorTypes: [String]?
    
    enum CodingKeys: String, CodingKey {
        case stationName = "station_name"
        case streetAddress = "street_address"
        case fuelTypeCode = "fuel_type_code"
        case evConnectorTypes = "evConnectorTypes"
        case city, zip, country, state, latitude, longitude
    }
    
    var fullAddress: String {
        "\(streetAddress), \(city), \(state) \(zip)"
    }
}

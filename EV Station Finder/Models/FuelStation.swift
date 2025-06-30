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
    let fuelType: FuelType
    let evConnectorTypes: [EVConnectors]?
    
    enum CodingKeys: String, CodingKey {
        case stationName = "station_name"
        case streetAddress = "street_address"
        case fuelType = "fuel_type_code"
        case evConnectorTypes = "ev_connector_types"
        case city, zip, country, state, latitude, longitude
    }
    
    var fullAddress: String {
        "\(streetAddress), \(city), \(state) \(zip)"
    }
}

import Foundation

struct FuelStation: Codable, Identifiable {
    let id = UUID()
    let station_name: String
    let street_address: String
    let city: String
    let state: String
    let country: String
    let zip: String
    
    enum CodingKeys: String, CodingKey {
        case station_name, street_address, city, state, country, zip
    }
}

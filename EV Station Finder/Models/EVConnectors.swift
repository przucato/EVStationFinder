enum EVConnectors: String, Codable, Identifiable {
    case NEMA1450
    case NEMA515
    case NEMA520
    case J1772 = "J1772"
    case ccs = "J1772COMBO"
    case chademo = "CHADEMO"
    case tesla = "TESLA"
    
    var id: String {
        rawValue
    }
    
    var typeName: String {
        switch self {
        case .NEMA1450: "NEMA 14-50"
        case .NEMA515: "NEMA 5-15"
        case .NEMA520: "NEMA 5-20"
        case .J1772: "J1772"
        case .ccs: "CCS"
        case .chademo: "CHAdeMO"
        case .tesla: "J3400"
        }
    }
}

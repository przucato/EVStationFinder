@testable import EV_Station_Finder

class ZipCodeValidatorMock: ZipCodeValidatorProtocol {
    var invalidZipCodePrompt: String = ""
    
    var validationPattern: String = ""
    var shouldReturnValid: Bool = true
    
    func isValid(zipCode: String) -> Bool {
        shouldReturnValid
    }
}

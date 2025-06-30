import Foundation

protocol ZipCodeValidatorProtocol {
    var validationPattern: String { get }
    var invalidZipCodePrompt: String { get }
    func isValid(zipCode: String) -> Bool
}

extension ZipCodeValidatorProtocol {
    func isValid(zipCode: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", validationPattern)
        return predicate.evaluate(with: zipCode)
    }
}

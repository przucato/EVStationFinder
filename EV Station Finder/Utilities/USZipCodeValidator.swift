class USZipCodeValidator: ZipCodeValidatorProtocol {
    var invalidZipCodePrompt: String = "Zip code must have 5 digits"
    
    /// Validates US ZIP codes (5-digit: "12345")
    var validationPattern: String = "^\\d{5}$"
}

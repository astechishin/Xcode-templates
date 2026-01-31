//___FILEHEADER___

import Foundation
import SwiftData
import Testing
@testable import ___PROJECTNAME:identifier___

class ___FILEBASENAMEASIDENTIFIER___ {
    static var bundle = { Bundle(for: ___FILEBASENAMEASIDENTIFIER___.self) }()

    static func memoryContainer() throws -> ModelContainer {
        try! ModelContainer(for: Schema(Base.modelList),
                            configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    }

    enum StringContent {
        case lettersDigits
        case lettersDigitsSymbols
        case lettersDigitsSymbolsNewlines
    }

    static func randomString(length: Int = 12, charTypes: StringContent = .lettersDigits) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let symbols = "!@#$%^&*(){}[]\\|/?<>~-+=:;.,"
        let newline = "\n"
        let characterSet: String

        switch charTypes {
        case .lettersDigits: characterSet = letters
        case .lettersDigitsSymbols: characterSet = letters + symbols
        case .lettersDigitsSymbolsNewlines: characterSet = letters + symbols + newline
        }

        var randomString = ""
        for _ in 0 ..< length {
            let randomIndex = Int(arc4random_uniform(UInt32(characterSet.count)))
            let letter = characterSet[characterSet.index(characterSet.startIndex, offsetBy: randomIndex)]
            randomString += String(letter)
        }
        return randomString
    }

    static func randomLengthRandomString(_ range: Range<Int>) -> String {
        return randomString(length: Int.random(in: range))
    }

    static func validateLoadFile(_ fileName: String, bundle: Bundle? = nil, file: StaticString=#filePath, line: UInt=#line) throws -> URL {
        let fileBundle = bundle ?? Self.bundle
        let urlIsh = fileBundle.url(forResource: fileName, withExtension: "")
        let url = try #require(urlIsh, "Failed to find test file: \(fileName)")
        return url
    }
}

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

    static func validateLoadFile(_ fileName: String, bundle: Bundle? = nil, file: StaticString=#filePath, line: UInt=#line) throws -> URL {
        let fileBundle = bundle ?? Self.bundle
        let urlIsh = fileBundle.url(forResource: fileName, withExtension: "")
        let url = try #require(urlIsh, "Failed to find test file: \(fileName)")
        return url
    }
}

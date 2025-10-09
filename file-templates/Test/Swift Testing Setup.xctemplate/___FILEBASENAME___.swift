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
}

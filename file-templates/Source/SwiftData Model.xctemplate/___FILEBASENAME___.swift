//___FILEHEADER___

import Foundation
import SwiftData

@Model
class ___FILEBASENAMEASIDENTIFIER___ {
    var <#model attribute#>: String
}

//--------------------------------------------------------------------------
// MARK: SwiftData predicates, etc.

extension ___FILEBASENAMEASIDENTIFIER___: CustomDebugStringConvertible {
    var debugDescription: String {
        "<#to-be-defined#>"
    }

    static let forwardSort = [SortDescriptor(\___FILEBASENAMEASIDENTIFIER___.name)]
    static let reverseSort = [SortDescriptor(\___FILEBASENAMEASIDENTIFIER___.name, order: .reverse)]
}

//--------------------------------------------------------------------------------------------
// MARK: Debug & Samples
#if DEBUG
extension ___FILEBASENAMEASIDENTIFIER___ {
    static let sample1 = ___FILEBASENAMEASIDENTIFIER___()
}
#endif


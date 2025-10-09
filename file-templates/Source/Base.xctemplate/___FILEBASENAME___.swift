//___FILEHEADER___
// - requires AppStandard macro framework

import Foundation
import OSLog
import AppStandard

@AppBase
struct ___FILEBASENAMEASIDENTIFIER___ {
    static let dollarFormat = "%.2f"

    enum LogCategoryType: String {
         case dbAction
         case importTx
         case importData
         case exportData
         case exportDB
         case runtime
         case testing
    }
}

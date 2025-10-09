//___FILEHEADER___

import Foundation
import SwiftUI

let isUITesting = false /* your UI test detection here */

@main
struct ___FILEBASENAMEASIDENTIFIER___ {
    static func main() {
        if isUITesting {
            Base.logTesting().info("UI test started")
            UITestApp.main()
        } else if NSClassFromString("XCTestCase") == nil {
            Base.logRuntime().info("starting main app")
            ___PROJECTNAME:identifier___App.main()
        } else {
            Base.logTesting().info("Windowless test started")
            TestApp.main()
        }
    }
}

//--------------------------------------------------------------------------
// MARK: Simple app for running Unit Tests - no windows or UI
struct TestApp: App {
    var body: some Scene {
        WindowGroup {  }
    }
}

//--------------------------------------------------------------------------------------------
// MARK: UI testing app
struct UITestApp: App {
    var body: some Scene {
        WindowGroup {
            //.. prod app bootstrapped for UI tests
            Text("Run the UI tests")
        }
    }
}


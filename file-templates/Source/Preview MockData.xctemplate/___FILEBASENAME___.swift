//___FILEHEADER___
// - requires PreviewData.json (usually stored in Preview Content) as part of a debug build
// - requires Base struct with logging

import SwiftUI
import SwiftData

#if DEBUG
struct ___FILEBASENAMEASIDENTIFIER___: PreviewModifier {
    func body(content: Content, context: ModelContainer) -> some View {
        content
            .modelContainer(context)
    }

    /// Build the Database container for in-memory when using Previews
    /// - Returns: An in =-memory Model Container (DB)
    static func makeSharedContext() async throws -> ModelContainer {
        let container = try! ModelContainer(
            for: Schema(Base.modelList),
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )

        do {
            if let url = Bundle.main.url(forResource: "PreviewData.json", withExtension: "") {
                try Serializable.load(from: url, into: container.mainContext)
            }
            else {
                Base.logImportData().error("PreviewData.json missing from main Bundle")
            }
        } catch {
            Base.logImportData().error("Load of PreviewData returned \(error)")
        }
        return container
    }
}

extension PreviewTrait where T == Preview.ViewTraits {
    static var mockData: Self = .modifier(___FILEBASENAMEASIDENTIFIER___())
}

#endif

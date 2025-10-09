//___FILEHEADER___
// - requires Base struct with logging

import SwiftData

struct ___FILEBASENAMEASIDENTIFIER___: Codable {
    struct <#Serialized Model#>Serial: Codable {

    }

    /// take an external JSON file (url) and load it into the Database defined by context
    /// - Parameters:
    ///   - url: the File URL of the JSON file (that follows the Codable definition of this structure) to load
    ///   - context: the database context to load the JSON contents into
    static func load(from url: URL, into context: ModelContext) throws {
        let load: Self
        do {
            load = try Self(loadFrom: url)
        } catch {
            Base.logImportData().error("Unable to load \(url.lastPathComponent) as JSON: \(error)")
            return
        }

        // TODO: Implement the processing of the loaded JSON struct
    }
}

extension ___FILEBASENAMEASIDENTIFIER___ {
    init(loadFrom url: URL) throws {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.dateDecodingStrategy = .formatted(DateFormatter.justDate)
        self = try decoder.decode(Self.self, from: data)
    }
}

extension ___FILEBASENAMEASIDENTIFIER___.<#Serialized Model#>Serial {
    init() {
        // TODO: Create from DB Model
    }
}
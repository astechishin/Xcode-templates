//___FILEHEADER___
// Requires Base for logging support

import Foundation
import SwiftData
import TabularData

struct ___FILEBASENAMEASIDENTIFIER___ {
    enum Columns: String, CaseIterable {
        case name = "Name"

        var csvType: CSVType {
            switch self {
            case .name:
                return .string
            }
        }

        static let names: [String] = {
            Self.allCases.map(\.rawValue)
        }()

        static let columnTypes: [String: CSVType] = {
            Self.allCases.reduce(into: [String: CSVType]()) { $0[$1.rawValue] = $1.csvType }
        }()
    }

    let context: ModelContext
    var totalCount = 0
    var processedCount = 0

    /// Process the CSV file passed in  and update the database
    /// - Parameter fileUrl: The CSV file to be processed
    mutating func doImport(from fileUrl: URL) {
        Base.logImportTx().info("Importing from: \(fileUrl)")
        do {
            let importData = try DataFrame(contentsOfCSVFile: fileUrl,
                                           columns: Self.Columns.names,
                                           types: Self.Columns.columnTypes,
                                           options: CSVReadingOptions(hasHeaderRow: true))

            for row in importData.rows {
                totalCount += 1
                if let name = row[Columns.name.rawValue] as? String {

                    // 📝 TODO:  Implement the CSV processing

                    // context.insert(a_record)
                    processedCount += 1
                }
            }
        } catch {
            Base.logImportTx().error("Failed loading \(fileUrl) with error: \(error)")
        }
    }
}

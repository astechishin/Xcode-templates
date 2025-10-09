//___FILEHEADER___
// Requires Base for logging support

import Foundation
import TabularData

struct ___FILEBASENAMEASIDENTIFIER___ {
    static func buildExportDataFrame(columns: [String], columnTypes: [String : CSVType], rowCount: Int) -> DataFrame {
        var exportFrame = DataFrame()

        for column in columns {
            if let columnType = columnTypes[column] {
                switch columnType {
                case .boolean:
                    exportFrame.append(column: Column<Bool>(name: column, capacity: rowCount))
                case .integer:
                    exportFrame.append(column: Column<Int>(name: column, capacity: rowCount))
                case .float:
                    exportFrame.append(column: Column<Float>(name: column, capacity: rowCount))
                case .double:
                    exportFrame.append(column: Column<Double>(name: column, capacity: rowCount))
                case .date:
                    exportFrame.append(column: Column<Date>(name: column, capacity: rowCount))
                case .string:
                    exportFrame.append(column: Column<String>(name: column, capacity: rowCount))
                default:
                    Base.logExportData().error("Column \(column) has unsupported type")
                }
            } else {
                Base.logExportData().error("Column \(column) has no associated type")
            }
        }

        return exportFrame
    }
}

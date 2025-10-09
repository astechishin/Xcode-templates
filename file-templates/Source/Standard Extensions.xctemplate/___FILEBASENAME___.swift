//___FILEHEADER___
// - requires the Base struct to be defined

import Foundation

extension DateFormatter {
    public static let jsonDateTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()

    public static let justDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.calendar = Calendar(identifier: .iso8601)
        //formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()

    public static let justMonthDay: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.setLocalizedDateFormatFromTemplate("MMMd")
        return formatter
    }()

    public static let shortDisplayDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.setLocalizedDateFormatFromTemplate("MMM d, yyyy")
        return formatter
    }()
}

extension String {
    func convertToBool() -> Bool {
        switch self {
        case "t": return true
        case "T": return true
        case "Y": return true
        case "true": return true
        default:
            return false
        }
    }
}

extension Int {
    func centsToDollar() -> Float {
        Float(self) / 100.0
    }

    func formattedCentsToDollar() -> String {
        String(format: Base.dollarFormat, centsToDollar())
    }
}


//___FILEHEADER___
// Requires access to the Testing Setup (TestSetup)

import Foundation
import Testing
@testable import ___PROJECTNAME:identifier___

struct ___FILEBASENAMEASIDENTIFIER___ {
    let expected: String

    /// Create the validator object to run against the specified file
    /// - Parameters:
    ///   - file: File name (this file is added to the Test Bundle target)
    ///   - sourceLocation: location that any issues are tied to (only supplied if validator is created
    ///   somewhere other than the error location)
    init?(expectedOutput file: String, sourceLocation: SourceLocation = #_sourceLocation) {
        guard let url = <#Test Setup Class#>.bundle.url(forResource: file, withExtension: "xml") else {
            Issue.record("Missing file: \(file).xml", sourceLocation: sourceLocation)
            return nil
        }

        do {
            expected = try String(contentsOf: url, encoding: .utf8)
        } catch {
            Issue.record("Unable to read \(file).xml: \(error)", sourceLocation: sourceLocation)
            return nil
        }
    }

    /// Determine if the passed in XML string matches the expected result (read in from a file when initialized)
    /// - Parameters:
    ///   - generated: XML (as a string) to be validated
    ///   - sourceLocation: default (where the test is triggered, use default)
    /// - Returns: True if matches the expected content
    func validate(_ generated: String, sourceLocation: SourceLocation = #_sourceLocation) -> Bool {
        if generated == expected {
            return true
        }

        Issue.record("\n\(prettyFirstDifferenceBetweenString(s1: expected, s2: generated))\n", sourceLocation: sourceLocation)
        return false
    }

    /// Find first differing character between two strings
    ///
    /// - Parameters:
    ///   - s1: First String
    ///   - s2: Second String
    ///
    /// - Returns: .DifferenceAtIndex(i) or .NoDifference
    public func firstDifferenceBetweenString(_ s1: String, and s2: String) -> FirstDifferenceResult {
        let len1 = s1.count
        let len2 = s2.count

        var s2Iterator = s2.makeIterator()
        var char2 = s2Iterator.next()
        var index = 0
        for char1 in s1 {
            if char1 == char2 {
                char2 = s2Iterator.next()
                index += 1
            } else {
                return .DifferenceAtIndex(index)
            }
        }

        if len1 < len2 {
            return .DifferenceAtIndex(len1)
        }

        if len2 < len1 {
            return .DifferenceAtIndex(len2)
        }

        return .NoDifference
    }

    /// Create a formatted String representation of difference between strings
    ///
    /// :param: s1 First string
    /// :param: s2 Second string
    ///
    /// :returns: a string, possibly containing significant whitespace and newlines
    public func prettyFirstDifferenceBetweenString(s1: String, s2: String) -> String {
        let firstDifferenceResult = firstDifferenceBetweenString(s1, and: s2)
        return prettyPrintFirstDifference(firstDifferenceResult, s1: s1, s2: s2)
    }

    /// Create a formatted String representation of a FirstDifferenceResult for two strings
    ///
    /// :param: firstDifferenceResult FirstDifferenceResult
    /// :param: s1 First string used in generation of firstDifferenceResult
    /// :param: s2 Second string used in generation of firstDifferenceResult
    ///
    /// :returns: a printable string, possibly containing significant whitespace and newlines
    public func prettyPrintFirstDifference(_ firstDifferenceResult: FirstDifferenceResult, s1: String, s2: String) -> String {

        func diffString(at index: Int, for s1: String, and s2: String) -> String {
            let markerArrow = "\u{2b06}"  // "⬆"

            // Show this many characters before and after the first difference
            let windowLength = 30

            let windowIndex = max(index - windowLength, 0)

            let sub1 = s1.window(around: index, window: windowLength)
            let sub2 = s2.window(around: index, window: windowLength)

            let markerPosition = min(windowLength, index) + (windowIndex > 0 ? 1 : 0)

            let markerPrefix = String(repeating: " ", count: markerPosition)
            let markerLine = "\(markerPrefix)\(markerArrow)"

            return "Difference at index \(index):\n\(sub1)\n\(sub2)\n\(markerLine)"
        }

        switch firstDifferenceResult {
        case .NoDifference:                 return "No difference"
        case .DifferenceAtIndex(let index): return diffString(at: index, for: s1, and: s2)
        }
    }


    /// Result type for firstDifferenceBetweenStrings()
    public enum FirstDifferenceResult: CustomStringConvertible, CustomDebugStringConvertible  {
        /// Strings are identical
        case NoDifference

        /// Strings differ at the specified index.
        ///
        /// This could mean that characters at the specified index are different,
        /// or that one string is longer than the other
        case DifferenceAtIndex(Int)

        /// Textual representation of a FirstDifferenceResult
        public var description: String {
            switch self {
            case .NoDifference: return "NoDifference"
            case .DifferenceAtIndex(let index): return "DifferenceAtIndex(\(index))"
            }
        }

        /// Textual representation of a FirstDifferenceResult for debugging purposes
        public var debugDescription: String {
            self.description
        }
    }
}

extension String {
    public func window(around index: Int, window: Int = 10) -> String {
        let ellipsis    = "\u{2026}"  // "…"
        let startingIndex = index - window < 0 ? self.startIndex : self.index(self.startIndex, offsetBy: index - window)
        let endingIndex = (index + window + 1) >= count ? self.endIndex : self.index(self.startIndex, offsetBy: index + window)
        let prefix = startingIndex == self.startIndex ? "" : ellipsis
        let suffix = endingIndex == self.endIndex ? "" : ellipsis

        return "\(prefix)\(self[startingIndex..<endingIndex].replacing("\n", with: "\u{21e8}"))\(suffix)"
    }
}

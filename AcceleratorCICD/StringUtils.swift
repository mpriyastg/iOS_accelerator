//
//  StringUtils.swift
//  AcceleratorCICD
//
//  Created by Mohanapriya on 17/07/23.
//

import Foundation
import UIKit

extension String {
    func capitalizeFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    // Reverses the characters in a string
    func reverse() -> String {
        return String(self.reversed())
    }

    // Checks if a string contains a substring
    func contains(substring: String) -> Bool {
        return range(of: substring, options: .caseInsensitive) != nil
    }

    // Trims leading and trailing whitespace from a string
    func trimWhitespace() -> String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    // Checks if a string is empty or contains only whitespace characters
    func isBlank() -> Bool {
        return trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    // Splits a string into an array of substrings based on a separator
    func split(separator: String) -> [String] {
        return components(separatedBy: separator)
    }

    // Repeats a string a given number of times
    func repeatString(count: Int) -> String {
        var result = ""
        for _ in 0..<count {
            result += self
        }
        return result
    }
    // Converts a string to lowercase
    func lowercase() -> String {
        return self.lowercased()
    }

    // Converts a string to uppercase
    func uppercase() -> String {
        return self.uppercased()
    }

    // Counts the number of occurrences of a substring in a string
    func countOccurrences(of substring: String) -> Int {
        return components(separatedBy: substring).count - 1
    }

    // Checks if a string starts with a given prefix
    func starts(with prefix: String) -> Bool {
        return self.hasPrefix(prefix)
    }

    // Checks if a string ends with a given suffix
    func ends(with suffix: String) -> Bool {
        return self.hasSuffix(suffix)
    }

    // Returns the character at a specified index in a string
    func character(at index: Int) -> Character? {
        guard index >= 0 && index < count else {
            return nil
        }
        return self[self.index(self.startIndex, offsetBy: index)]
    }

    // Returns the index of the first occurrence of a substring in a string
    func indexOf(substring: String) -> Int? {
        return range(of: substring)?.lowerBound.utf16Offset(in: self)
    }

    // Removes all occurrences of a substring from a string
    func removeOccurrences(of substring: String) -> String {
        return replacingOccurrences(of: substring, with: "")
    }

    // Removes all whitespace characters from a string
    func removeWhitespace() -> String {
        return components(separatedBy: .whitespaces).joined()
    }

    // Replaces all occurrences of a substring with another string
    func replaceOccurrences(of target: String, with replacement: String) -> String {
        return replacingOccurrences(of: target, with: replacement)
    }

    // Checks if a string is a valid email address
    func isValidEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }

    // Encodes a string as Base64
    func base64Encoded() -> String {
        return Data(self.utf8).base64EncodedString()
    }

    // Decodes a Base64-encoded string
    func base64Decoded() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }

    // Appends a string to another string
    func append(_ string: String) -> String {
        return self + string
    }

    // Removes the first character from a string
    func removeFirstCharacter() -> String {
        return String(dropFirst())
    }

    // Removes the last character from a string
    func removeLastCharacter() -> String {
        return String(dropLast())
    }

    // Slices a string from a start index to an end index
    func slice(from start: Int, to end: Int) -> String {
        let startIndex = index(self.startIndex, offsetBy: start)
        let endIndex = index(self.startIndex, offsetBy: end)
        return String(self[startIndex..<endIndex])
    }

    // Checks if a string contains only numeric characters
    func isNumeric() -> Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }

    // Checks if a string is a valid URL
    func isValidURL() -> Bool {
        return URL(string: self) != nil
    }

    // Encodes a string for URL query parameter
    func urlEncoded() -> String? {
        return addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
    // Checks if a string is alphanumeric
    func isAlphanumeric() -> Bool {
        return range(of: "^[a-zA-Z0-9]+$", options: .regularExpression) != nil
    }

    // Removes HTML tags from a string
    func removeHTMLTags() -> String {
        return replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }

    // Returns a substring with a specified length
    func substring(to length: Int) -> String {
        let endIndex = index(startIndex, offsetBy: Swift.min(length, count))
        return String(self[startIndex..<endIndex])
    }

    // Converts a string to a URL
    func toURL() -> URL? {
        return URL(string: self)
    }

    // Truncates a string to a specified length and appends an ellipsis if necessary
    func truncate(to length: Int) -> String {
        if count > length {
            let endIndex = index(startIndex, offsetBy: length)
            return String(self[startIndex..<endIndex]) + "..."
        }
        return self
    }

    // Returns the lines of a string as an array
    func lines() -> [String] {
        return components(separatedBy: .newlines)
    }

    // Removes all non-numeric characters from a string
    func removeNonNumeric() -> String {
        let characterSet = CharacterSet.decimalDigits.inverted
        let components = self.components(separatedBy: characterSet)
        return components.joined()
    }

    // Checks if a string contains only alphabetic characters
    func isAlphabetic() -> Bool {
        return range(of: "^[a-zA-Z]+$", options: .regularExpression) != nil
    }

    // Converts a string to a decimal number
    func toDecimal() -> Decimal? {
        return Decimal(string: self)
    }

    // Converts a string to a floating-point number
    func toFloat() -> Float? {
        return Float(self)
    }
    // Checks if a string is a valid phone number
    func isValidPhoneNumber() -> Bool {
        let phoneRegex = #"^\d{3}-\d{3}-\d{4}$"#
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phonePredicate.evaluate(with: self)
    }
    // Reverses the words in a string
    func reverseWords() -> String {
        let words = components(separatedBy: .whitespaces)
        let reversedWords = words.reversed()
        return reversedWords.joined(separator: " ")
    }

    // Converts a string to an integer
    func toInt() -> Int? {
        return Int(self)
    }

    // Returns a random string of a specified length
    static func random(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map { _ in letters.randomElement()! })
    }

    // Checks if a string contains only lowercase characters
    func isLowercase() -> Bool {
        return self == lowercase()
    }

    // Checks if a string contains only uppercase characters
    func isUppercase() -> Bool {
        return self == uppercase()
    }

    // Replaces the first occurrence of a substring with another string
    func replaceFirstOccurrence(of target: String, with replacement: String) -> String {
        guard let range = range(of: target) else {
            return self
        }
        return replacingCharacters(in: range, with: replacement)
    }
    func slugify() -> String {
        let slug = lowercased()
            .replacingOccurrences(of: "[^a-z0-9]+", with: "-", options: .regularExpression)
            .replacingOccurrences(of: "-{2,}", with: "-", options: .regularExpression)
            .trimmingCharacters(in: CharacterSet(charactersIn: "-"))
        return slug
    }
    var extractNumbersFromString: String {
           let pattern = UnicodeScalar("0")..."9"
           return String(unicodeScalars
               .compactMap { pattern ~= $0 ? Character($0) : nil })
       }
    func removeInvalidCharsFromPhoneNumber() -> String {
           var phone = self.replacingOccurrences(of: "(", with: "")
           phone = phone.replacingOccurrences(of: ")", with: "")
           phone = phone.replacingOccurrences(of: " ", with: "")
           return phone.replacingOccurrences(of: "-", with: "")
       }
    func removeCharactersAfterDot() -> String {
           if contains(".") {
               let endIndex = range(of: ".")!.lowerBound
               return String(self[..<endIndex])
           }
           return self
       }

       func removeCharactersAfterWord(word: String) -> String {
           if contains(word) {
               let endIndex = range(of: word)!.lowerBound
               return String(self[..<endIndex])
           }
           return self
       }
}

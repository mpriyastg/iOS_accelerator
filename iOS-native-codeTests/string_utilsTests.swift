//
//  iOS_native_codeTests.swift
//  iOS-native-codeTests
//
//  Created by Mohanapriya on 08/07/23.
//

import XCTest
@testable import iOS_native_code

final class string_utilsTests: XCTestCase {

    func testCapitalizeFirstLetter() {
        let str = "test string"
        XCTAssertEqual(str.capitalizeFirstLetter(), "Test string")
    }
    
    func testReverse() {
        let str = "gnitset"
        XCTAssertEqual(str.reverse(), "testing")
    }
    
    func testContainsSubstringTrue() {
        let str = "testing"
        XCTAssertTrue(str.contains(substring: "test"))
    }
    
    func testContainsSubstringFalse() {
        let str = "testing"
        XCTAssertFalse(str.contains(substring: "str"))
    }
    
    func testTrimWhitespace() {
        let str = "    test string "
        XCTAssertEqual(str.trimWhitespace(), "test string")
    }
    
    func testIsBlankTrue() {
        let str = "      "
        XCTAssertTrue(str.isBlank())
    }

    func testIsBlankFalse() {
        let str = "   test          "
        XCTAssertFalse(str.isBlank())
    }
    
    func testSplit() {
        let str = "integer,double,string"
        XCTAssertEqual(str.split(separator: ","), ["integer", "double", "string"])
    }
    
    func testRepeat() {
        let str = "test"
        XCTAssertEqual(str.repeatString(count: 3), "testtesttest")
    }
    
    func testLowerCase() {
        let str = "TESTING"
        XCTAssertEqual(str.lowercase(), "testing")
    }
    
    func testUpperCase() {
        let str = "testing"
        XCTAssertEqual(str.uppercase(), "TESTING")
    }
    
    func testCountOccurences() {
        let str = "testcase to test occurences of test substring"
        XCTAssertEqual(str.countOccurrences(of: "test"), 3)
    }
    
    func testStartsWithTrue() {
        let str = "test string"
        XCTAssertTrue(str.starts(with: "test"))
    }
    
    func testStartsWithFalse() {
        let str = "test string"
        XCTAssertFalse(str.starts(with: "string"))
    }
    
    func testEndsWithTrue() {
        let str = "test string"
        XCTAssertTrue(str.ends(with: "string"))
    }
    
    func testEndsWithFalse() {
        let str = "test string"
        XCTAssertFalse(str.ends(with: "test"))
    }
    
    func testCharacterAt() {
        let str = "test string"
        XCTAssertEqual(str.character(at: 2), "s")
    }
    
    func testIndexOf() {
        let str = "test string"
        XCTAssertEqual(str.indexOf(substring: "s"), 2)
    }
    
    func testRemoveOccurences() {
        let str = "test string"
        XCTAssertEqual(str.removeOccurrences(of: "s"), "tet tring")
    }
    
    func testRemoveWhiteSpace() {
        let str = "test string"
        XCTAssertEqual(str.removeWhitespace(), "teststring")
    }
    
    func testReplacOccurences() {
        let str = "test string"
        XCTAssertEqual(str.replaceOccurrences(of: "test", with: "sample"), "sample string")
    }
    
    func testIsValidEmailTrue() {
        let email = "user1@stgit.com"
        XCTAssertTrue(email.isValidEmail())
    }
    
    func testIsValidEmailFalse() {
        let email = "user1stgit.com"
        XCTAssertFalse(email.isValidEmail())
    }
    
    func testBase64Encoded() {
        let str = "sample string"
        XCTAssertEqual(str.base64Encoded(), "c2FtcGxlIHN0cmluZw==")
    }
    
    func testBase64Decoded() {
        let str = "c2FtcGxlIHN0cmluZw=="
        XCTAssertEqual(str.base64Decoded(), "sample string")
    }
    
    func testAppendString() {
        let str = "test"
        XCTAssertEqual(str.append(" string"), "test string")
    }
    
    func testRemoveFirstCharacter() {
        let str = "iOS"
        XCTAssertEqual(str.removeFirstCharacter(), "OS")
    }
    
    func testRemoveLastCharacter() {
        let str = "users"
        XCTAssertEqual(str.removeLastCharacter(), "user")
    }
    
    func testSlice() {
        let str = "slicing the string"
        XCTAssertEqual(str.slice(from: 8, to: 11), "the")
    }
    
    func testIsNumericTrue() {
        let str = "2324"
        XCTAssertTrue(str.isNumeric())
    }
    
    func testIsNumericFalse() {
        let str = "test"
        XCTAssertFalse(str.isNumeric())
    }
    
    func testIsValidUrlTrue() {
        let url = "www.google.com"
        XCTAssertTrue(url.isValidURL())
    }
    
    
    func testIsValidUrlFalse() {
        let url = ""
        XCTAssertFalse(url.isValidURL())
    }
    
    func testUrlEncoded() {
        let url = "www.google.com"
        XCTAssertEqual(url.urlEncoded(), "www.google.com")
    }
    
    func testIsAlphaNumnericTrue() {
        let str = "test1"
        XCTAssertTrue(str.isAlphanumeric())
    }
    
    func testIsAlphaNumericFalse() {
        let str = "@#$%"
        XCTAssertFalse(str.isAlphanumeric())
    }
    
    func testRemoveHTMLTags() {
        let str = "<html><h1>Test</h1></html>"
        XCTAssertEqual(str.removeHTMLTags(), "Test")
    }
    
    func testSubstring() {
        let str = "Testing string"
        XCTAssertEqual(str.substring(to: 7), "Testing")
    }
    
    func testToUrl() {
        let str = "www.google.com"
        XCTAssertEqual(str.toURL(), URL(string: str))
    }
    
    func testTruncate() {
        let str = "Testing string"
        XCTAssertEqual(str.truncate(to: 7), "Testing...")
    }
    
    func testLines() {
        let str = "Testing string\nUnit Testing\nUI Testing"
        XCTAssertEqual(str.lines(), ["Testing string","Unit Testing", "UI Testing"])
    }
    
    func testRemoveNonNumneric() {
        let str = "Test123"
        XCTAssertEqual(str.removeNonNumeric(), "123")
    }
    
    func testIsAlphabeticTrue() {
        let str = "TEST"
        XCTAssertTrue(str.isAlphabetic())
    }
    
    func testIsAphabeticFalse() {
        let str = "123"
        XCTAssertFalse(str.isAlphabetic())
    }
    
    func testToDecimal() {
        let str = "100"
        XCTAssertEqual(str.toDecimal(), 100)
    }
    
    func testToFloat() {
        let str = "2.15"
        XCTAssertEqual(str.toFloat(), 2.15)
    }
    
    func testIsValidPhoneNumberTrue() {
        let phone = "987-564-1234"
        XCTAssertTrue(phone.isValidPhoneNumber())
    }
    
    func testIsValidPhoneNumberFalse() {
        let phone = "987-64-134"
        XCTAssertFalse(phone.isValidPhoneNumber())
    }
    
    func testToInt() {
        let str = "32423"
        XCTAssertEqual(str.toInt(), 32423)
    }
    
    func testRandomStringLength() {
        let randomString = String.random(length: 4)
        XCTAssertEqual(randomString.count, 4)
    }
    
    func testIsLowercaseTrue() {
        let str = "unit testing"
        XCTAssertTrue(str.isLowercase())
    }
    
    func testIsLowercaseFalse() {
        let str = "TESTING"
        XCTAssertFalse(str.isLowercase())
    }
    
    func testIsUppercaseTrue() {
        let str = "TESTING"
        XCTAssertTrue(str.isUppercase())
    }
    
    func testIsUppercaseFalse() {
        let str = "unit testing"
        XCTAssertFalse(str.isUppercase())
    }
    
    func testReplaceFirstOccurence() {
        let str = "UI Testing"
        XCTAssertEqual(str.replaceFirstOccurrence(of: "UI", with: "Unit"), "Unit Testing")
    }
    
    func testSlugify() {
        let str = "Testing String"
        XCTAssertEqual(str.slugify(), "testing-string")
    }
    
    func testExtactNumbersFromString() {
        let str = "Test123"
        XCTAssertEqual(str.extractNumbersFromString, "123")
    }
    
    func testRemoveInvalidCharactersFromPhoneNumber() {
        let phone = "(987-453-2316)"
        XCTAssertEqual(phone.removeInvalidCharsFromPhoneNumber(), "9874532316")
    }
    
    func testRemoveCharactersAfterDot() {
        let str = "www.google.com"
        
    }
}



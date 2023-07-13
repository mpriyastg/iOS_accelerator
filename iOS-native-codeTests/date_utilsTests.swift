//
//  date_utilsTests.swift
//  iOS-native-codeTests
//
//  Created by Mohanapriya on 11/07/23.
//

import XCTest
@testable import iOS_native_code

final class date_utilsTests: XCTestCase {
        
    func testFormatData() {
        XCTAssertEqual(DateUtility.formatDate(Date.from(year: 2024, month: 07, day: 11)!), "Jul 11, 2024")
    }
    
    func testChangeDateFormat() {
        XCTAssertEqual(DateUtility.changeDateFormat("Jul 11, 2023", from: "MMM dd, yyyy", to: "dd/MM/yyyy"), "11/07/2023")
    }
    
    func testConvertDateToString() {
        XCTAssertEqual(DateUtility.convertDateToString(Date.from(year: 2023, month: 07, day: 11)!, format: "MM/dd/yy"), "07/11/23")
    }
    
    func testConvertStringToDate() {
        XCTAssertEqual(DateUtility.convertStringToDate("07/11/23", format: "MM/dd/yy"), Date.from(year: 2023, month: 07, day: 11)!)
    }
    
    func testCalculateTimeDifferenceInSeconds() {
        XCTAssertEqual(DateUtility.calculateTimeDifferenceInSeconds(from: Date.from(year: 2023, month: 07, day: 10)!, to: Date.from(year: 2023, month: 07, day: 11)!), 86400.0)
    }
    
    func testFormatTime() {
        XCTAssertEqual(DateUtility.formatTime(Date.from(year: 2024, month: 07, day: 11, hour: 02, min: 10, sec: 00)!), "2:10:00 AM")
    }
    
    func testGetYear() {
        XCTAssertEqual(DateUtility.getYear(Date.from(year: 2023, month: 07, day: 11)!), 2023)
    }
    
    func testGetMonth() {
        XCTAssertEqual(DateUtility.getMonth(Date.from(year: 2023, month: 07, day: 11)!), 07)
    }
    
    func testGetDay() {
        XCTAssertEqual(DateUtility.getDay(Date.from(year: 2023, month: 07, day: 11)!), 11)
    }
    
    func testGetNextDay() {
        XCTAssertEqual(DateUtility.getNextDay(Date.from(year: 2023, month: 07, day: 11)!), Date.from(year: 2023, month: 07, day: 12)!)
    }
    
    func testGetPreviousDay() {
        XCTAssertEqual(DateUtility.getPreviousDay(Date.from(year: 2023, month: 07, day: 11)!), Date.from(year: 2023, month: 07, day: 10)!)
    }
    
    func testAddDays() {
        XCTAssertEqual(DateUtility.addDays(Date.from(year: 2023, month: 07, day: 11)!, days: 10), Date.from(year: 2023, month: 07, day: 21)!)
    }
    
    func testSubtractDays() {
        XCTAssertEqual(DateUtility.subtractDays(Date.from(year: 2023, month: 07, day: 11)!, days: 10), Date.from(year: 2023, month: 07, day: 01)!)
    }
    
    func testIsSameDay() {
        XCTAssertTrue(DateUtility.isSameDay(Date.from(year: 2023, month: 07, day: 11)!, Date.from(year: 2023, month: 07, day: 11)!))
    }
    
    func testFormatShortDate() {
        XCTAssertEqual(DateUtility.formatDate(Date.from(year: 2023, month: 07, day: 11)!), "Jul 11, 2023")
    }
    
    func testFormatLongDate() {
        XCTAssertEqual(DateUtility.formatLongDate(Date.from(year: 2023, month: 07, day: 11)!), "July 11, 2023")
    }
    
    func testFormatCustomDate() {
        XCTAssertEqual(DateUtility.formatCustomDate(Date.from(year: 2023, month: 07, day: 11)!, format: "MM-dd-yyyy"), "07-11-2023")
    }
    
    func testFormatDayOfWeek() {
        XCTAssertEqual(DateUtility.formatDayOfWeek(Date.from(year: 2023, month: 07, day: 11)!), "Tuesday")
    }
    
    func testFormatMonth() {
        XCTAssertEqual(DateUtility.formatMonth(Date.from(year: 2023, month: 07, day: 11)!), "July")
    }
    
    func testFormatYear() {
        XCTAssertEqual(DateUtility.formatYear(Date.from(year: 2023, month: 07, day: 11)!), "2023")
    }
    
    func testFormatMonthYear() {
        XCTAssertEqual(DateUtility.formatMonthYear(Date.from(year: 2023, month: 07, day: 11)!), "July 2023")
    }
    
    func testFormatDayMonthYear() {
        XCTAssertEqual(DateUtility.formatDayMonthYear(Date.from(year: 2023, month: 07, day: 11)!), "11 July 2023")
    }
    
    func testFormatWeekdayMonthDay() {
        XCTAssertEqual(DateUtility.formatWeekdayMonthDay(Date.from(year: 2023, month: 07, day: 11)!), "Tuesday, July 11")
    }
    
    func testFormatWeekdayShortMonthDay() {
        XCTAssertEqual(DateUtility.formatWeekdayShortMonthDay(Date.from(year: 2023, month: 07, day: 11)!), "Tue, Jul 11")
    }
}

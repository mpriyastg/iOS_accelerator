//
//  AcceleratorCICDTests.swift
//  AcceleratorCICDTests
//
//  Created by Mohanapriya on 17/07/23.
//

import XCTest
@testable import AcceleratorCICD


final class Test_StringUtils: XCTestCase {
    
    func testReverse() {
        let str = "gnitset"
        XCTAssertEqual(str.reverse(), "testing")
    }
    
}

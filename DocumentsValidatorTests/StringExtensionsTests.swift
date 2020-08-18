//
//  StringExtensionsTests.swift
//  DocumentsValidatorTests
//
//  Created by Guilherme Tavares Shimamoto on 17/08/20.
//  Copyright © 2020 Guilherme Shimamoto. All rights reserved.
//

import XCTest
@testable import DocumentsValidator

class StringExtensionsTests: XCTestCase {

    func testOnlyNumbers() {
        var sut = "abc123d"
        XCTAssertEqual(sut.onlyNumbers(), "123")
        
        sut = "124"
        XCTAssertEqual(sut.onlyNumbers(), "124")
        
        sut = "abc"
        XCTAssertEqual(sut.onlyNumbers(), "")
        
        sut = ""
        XCTAssertEqual(sut.onlyNumbers(), "")
    }
}

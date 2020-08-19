//
//  DocumentsValidatorTests.swift
//  DocumentsValidatorTests
//
//  Created by Guilherme Tavares Shimamoto on 17/08/20.
//  Copyright © 2020 Guilherme Shimamoto. All rights reserved.
//

import XCTest
@testable import DocumentsValidator

class DocumentsValidatorTests: XCTestCase {
    
    let sut: Validator = Validator()

    func testValidCpf() {
        var cpf = "455.500.830-86"
        XCTAssertTrue(sut.validate(cpf: cpf))
        
        cpf = "45550083086"
        XCTAssertTrue(sut.validate(cpf: cpf))
    }
    
    func testInvalidCpf() {
        var cpf = "455.500.830-87"
        XCTAssertFalse(sut.validate(cpf: cpf))
        
        cpf = "4555008308a"
        XCTAssertFalse(sut.validate(cpf: cpf))
        
        cpf = "4555008"
        XCTAssertFalse(sut.validate(cpf: cpf))
        
        cpf = ""
        XCTAssertFalse(sut.validate(cpf: cpf))
        
        cpf = "11111111111"
        XCTAssertFalse(sut.validate(cpf: cpf))
    }
    
    func testValidCpnj() {
        var cnpj = "25.559.813/0001-47"
        XCTAssertTrue(sut.validate(cnpj: cnpj))
        
        cnpj = "59541264000103"
        XCTAssertTrue(sut.validate(cnpj: cnpj))
    }
    
    func testInvalidCpnj() {
        var cnpj = "11.111.111/1111-"
        XCTAssertFalse(sut.validate(cnpj: cnpj))
        
        cnpj = ""
        XCTAssertFalse(sut.validate(cnpj: cnpj))
        
        cnpj = "25.559.813/0001-42"
        XCTAssertFalse(sut.validate(cnpj: cnpj))
        
        cnpj = "11.111.111/1111-11"
        XCTAssertFalse(sut.validate(cnpj: cnpj))
    }
}

//
//  Validator.swift
//  DocumentsValidator
//
//  Created by Guilherme Tavares Shimamoto on 17/08/20.
//  Copyright © 2020 Guilherme Shimamoto. All rights reserved.
//

import Foundation

public final class Validator {
    
    public init() {}

    public func validate(cpf: String) -> Bool {
        let cpf = cpf.onlyNumbers()
        guard cpf.count == 11 else { return false }
        
        let lastCharacter = cpf.last
        let charactersCount = cpf.filter { $0 == lastCharacter }.count
        guard charactersCount != 11 else { return false }

        let i1 = cpf.index(cpf.startIndex, offsetBy: 9)
        let i2 = cpf.index(cpf.startIndex, offsetBy: 10)

        let d1 = cpf[i1].wholeNumberValue
        let d2 = cpf[i2].wholeNumberValue

        var temp1 = 0, temp2 = 0
        temp1 = cpfDigit(slice: cpf.prefix(9), initialMult: 10)
        temp2 = cpfDigit(slice: cpf.prefix(9), initialMult: 11)

        temp1 %= 11
        temp1 = temp1 < 2 ? 0 : 11-temp1

        temp2 += temp1 * 2
        temp2 %= 11
        temp2 = temp2 < 2 ? 0 : 11-temp2

        return temp1 == d1 && temp2 == d2
    }
    
    private func cpfDigit(slice: Substring, initialMult: Int) -> Int {
        var i = 0
        let digit = slice.reduce(into: 0) {
            let charValue = ($1.wholeNumberValue ?? 0)
            let value = charValue * (initialMult - i)
            i += 1
            $0 += value
        }
        return digit
    }

    public func validate(cnpj: String) -> Bool {
        let cnpj = cnpj.onlyNumbers()
        let numberValues = cnpj.compactMap{ (char: Character) -> Int? in
            return char.wholeNumberValue
        }

        guard cnpj.count == 14 && Set(numberValues).count != 1 else { return false }
        
        let d1 = numberValues[12]
        let d2 = numberValues[13]
        
        var temp1 = cnpjDigit(slice: numberValues.prefix(12))
        temp1 %= 11
        temp1 = temp1 < 2 ? 0 : 11-temp1
        
        var temp2 = cnpjDigit(slice: numberValues.prefix(13))
        temp2 %= 11
        temp2 = temp2 < 2 ? 0 : 11-temp2

        return d1 == temp1 && d2 == temp2
    }
    
    private func cnpjDigit(slice: ArraySlice<Int>) -> Int {
        var i = 2
        let digit = slice.reversed().reduce(into: 0) {
            let value = $1 * i
            i += 1
            i = i == 10 ? 2 : i
            $0 += value
        }
        return digit
    }
}

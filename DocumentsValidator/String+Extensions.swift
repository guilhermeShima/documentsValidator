//
//  String+Extensions.swift
//  DocumentsValidator
//
//  Created by Guilherme Tavares Shimamoto on 17/08/20.
//  Copyright © 2020 Guilherme Shimamoto. All rights reserved.
//

import Foundation

extension String {
    func onlyNumbers() -> String {
        let validChars : Set<Character> = Set("1234567890")
        return String(self.filter { validChars.contains($0) })
    }
}

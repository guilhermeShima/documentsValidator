//
//  ViewController.swift
//  DocumentsValidatorExamples
//
//  Created by Guilherme Tavares Shimamoto on 17/08/20.
//  Copyright © 2020 Guilherme Shimamoto. All rights reserved.
//

import UIKit
import DocumentsValidator

class ViewController: UIViewController {
    
    let validator = Validator()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let isValidCpf = validator.validate(cpf: "480.376.008-07")
        print("Is valid cpf? \(isValidCpf)")
        
        let isValidCnpj = validator.validate(cnpj: "77.572.281/0001-81")
        print("Is valid cnpj? \(isValidCnpj)")
    }
}


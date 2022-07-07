//
//  ViewElements.swift
//  Login-ViewCode
//
//  Created by Josicleison on 01/07/22.
//

import UIKit

class RegisterViewElements: UIViewController {
    
    let registerLabel: UILabel = {
        
        let registerLabel = UILabel()
        registerLabel.text = "Digite seu email"
        registerLabel.textAlignment = .center
        registerLabel.font = .systemFont(ofSize: 35)
        
        return registerLabel
    }()
    
    let registerTextField: UITextField = {
        
        let registerTextField = UITextField()
        registerTextField.backgroundColor = .separator
        registerTextField.placeholder = "   email"
        registerTextField.layer.cornerRadius = 10
        registerTextField.font = .systemFont(ofSize: 15,
                                             weight: .semibold)
        
        return registerTextField
    }()
    
    let registerButton: UIButton = {
        
        let registerButton = UIButton()
        registerButton.backgroundColor = .green
        registerButton.setTitle("Done", for: .normal)
        registerButton.layer.cornerRadius = 10
        
        return registerButton
    }()
    
    lazy var stowageStackView: UIStackView = {
        
        let registerStackView = UIStackView(arrangedSubviews: [registerLabel,
                                                               registerTextField,
                                                               registerButton])
        registerStackView.spacing = 20
        registerStackView.distribution = .fillEqually
        registerStackView.axis = .vertical
        
        let stowageStackView = UIStackView(arrangedSubviews: [registerStackView])
        stowageStackView.axis = .horizontal
        stowageStackView.alignment = .center
        
        return stowageStackView
    }()
}

//
//  LoginViewModel.swift
//  Login-ViewCode
//
//  Created by Josicleison on 01/07/22.
//

import Foundation
import UIKit

class LoginViewElements: UIViewController {
    
    let emailTextField: UITextField = {
        
        let emailTextField = UITextField()
        emailTextField.backgroundColor = .separator
        emailTextField.placeholder = "   Email"
        emailTextField.layer.cornerRadius = 10
        emailTextField.font = .systemFont(ofSize: 15,
                                          weight: .semibold)
        return emailTextField
    }()
    
    let passwordTextField: UITextField = {
        
        let passwordTextField = UITextField()
        passwordTextField.backgroundColor = .separator
        passwordTextField.placeholder = "   Senha"
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.font = .systemFont(ofSize: 15,
                                             weight: .semibold)
        return passwordTextField
    }()
    
    let registerButton: UIButton = {
        
        let registerButton = UIButton()
        registerButton.backgroundColor = .blue
        registerButton.setTitle("Register", for: .normal)
        registerButton.layer.cornerRadius = 10
        
        return registerButton
    }()
    
    let loginButton: UIButton = {
        
        let loginButton = UIButton()
        loginButton.backgroundColor = .red
        loginButton.setTitle("Login", for: .normal)
        loginButton.layer.cornerRadius = 10
        
        return loginButton
    }()
    
    lazy var stowageStackView: UIStackView = {
        
        let loginLabel = UILabel()
        loginLabel.text = "Fazer login"
        loginLabel.textAlignment = .center
        loginLabel.font = .systemFont(ofSize: 35)
        
        let loginStackView = UIStackView(arrangedSubviews: [loginLabel,
                                                            emailTextField,
                                                            passwordTextField,
                                                            registerButton,
                                                            loginButton])
        loginStackView.spacing = 20
        loginStackView.distribution = .fillEqually
        loginStackView.axis = .vertical
        
        let stowageStackView = UIStackView(arrangedSubviews: [loginStackView])
        stowageStackView.axis = .horizontal
        stowageStackView.alignment = .center
        
        return stowageStackView
    }()
}

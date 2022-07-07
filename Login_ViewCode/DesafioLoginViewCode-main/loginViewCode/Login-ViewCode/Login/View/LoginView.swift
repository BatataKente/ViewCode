//
//  ViewController.swift
//  Login-ViewCode
//
//  Created by Josicleison on 30/06/22.
//

import UIKit

class LoginView: LoginViewModel {
    
    @objc func buttonAction(sender: UIButton!) {
        
        if sender.titleLabel?.text == "Login" {
            
            if validateTextField(emailTextField.text ?? "") &&
               validateTextField(passwordTextField.text ?? "") &&
               validateLogin(emailTextField.text ?? "",
                             passwordTextField.text ?? "") {
                
                emailTextField.text = ""
                passwordTextField.text = ""
                
                let homeView = HomeView()
                homeView.modalPresentationStyle = .fullScreen
                present(homeView, animated: true, completion: nil)
            }
        }
        else {
            
            emailTextField.text = ""
            passwordTextField.text = ""
            
            let registerview = RegisterView()
            registerview.modalPresentationStyle = .fullScreen
            present(registerview, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        registerButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        view.backgroundColor = .white
        
        setup()
    }
}

extension LoginView: ViewCode {
    
    func buildViewHierarchy() {
        
        view.addSubview(stowageStackView)
    }
    
    func addConstraints() {
        
        stowageStackView.fillSuperview(padding: UIEdgeInsets(top: 0,
                                                             left: 20,
                                                             bottom: 0,
                                                             right: 20))
    }
}

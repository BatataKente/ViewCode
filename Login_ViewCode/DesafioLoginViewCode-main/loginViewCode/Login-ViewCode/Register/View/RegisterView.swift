//
//  RegisterView.swift
//  Login-ViewCode
//
//  Created by Josicleison on 30/06/22.
//

import UIKit
import CoreData

class RegisterView: RegisterViewElements, RegisterViewModel {
    
    var stage = 0
    var email = "",
        password = ""
    
    @objc func buttonAction(sender: UIButton!) {
        
        if validateTextField(registerTextField.text ?? "") {
            
            switch stage {
                
            case 0:
                
                if validateTextField(registerTextField.text ?? "") &&
                   validateEmail(registerTextField.text ?? "") {
                    
                    email = registerTextField.text ?? ""
                    
                    stage += 1
                    registerTextField.text = ""
                    registerLabel.text = "Agora digite a senha"
                    registerTextField.placeholder = "   senha"
                }
                
            case 1:
                
                if validateTextField(registerTextField.text ?? "") {
                    
                    password = registerTextField.text ?? ""
                    
                    stage += 1
                    registerTextField.text = ""
                    registerLabel.text = "Confirme a senha"
                    registerTextField.placeholder = "   senha"
                }
                
            default:
                
                if validateTextField(registerTextField.text ?? "") &&
                   validatePassword(password,
                                    registerTextField.text ?? ""){
                    
                    if let error = registerCoreData(email,
                                                    registerTextField.text ?? "") {
                            
                        alert("Falha", "Erro ao registrar dados. \(error)")
                    }
                    else {
                        
                        let loginView = LoginView()
                        loginView.modalPresentationStyle = .fullScreen
                        present(loginView, animated: false, completion: nil)
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        registerButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        view.backgroundColor = .white
        
        setup()
    }
}

extension RegisterView: ViewCode {
    
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

extension RegisterView {
    
}

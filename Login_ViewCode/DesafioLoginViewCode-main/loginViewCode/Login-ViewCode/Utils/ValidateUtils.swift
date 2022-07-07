//
//  ValidateUtils.swift
//  Login-ViewCode
//
//  Created by Josicleison on 01/07/22.
//

import UIKit

extension UIViewController {
    
    func validateEmail(_ email: String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        if emailPred.evaluate(with: email) {
            
            return true
        }
        alert("Falha ao cadastrar dado", "Email inválido")
        
        return false
    }
    
    func validateTextField(_ text: String) -> Bool {
        
        if text != "" {

            return true
        }
        alert("Falha ao cadastrar dado", "Digite um valor válido")
        
        return false
    }
    
    func validatePassword(_ password: String,
                          _ passwordConfirm: String) -> Bool {
        
        if password == passwordConfirm {

            return true
        }
        alert("Falha", "A confirmação de senha difere da senha")
        
        return false
    }
}

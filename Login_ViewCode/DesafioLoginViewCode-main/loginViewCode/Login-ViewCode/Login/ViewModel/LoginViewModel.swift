//
//  LoginViewModel.swift
//  Login-ViewCode
//
//  Created by Josicleison on 01/07/22.
//

import UIKit
import CoreData

class LoginViewModel: LoginViewElements {
    
    func validateLogin(_ email: String,_ password: String) -> Bool {
        
            var users: [NSManagedObject] = []
            
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return false}
            
            let managedContext = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
            
            do
            {
                users = try managedContext.fetch(fetchRequest)
                for user in users
                {
                    let storedemail = user.value(forKey: "email") as? String
                    let storedPassword = user.value(forKey: "password") as? String
                    
                    if email == "" || password == ""
                    {
                        return false
                    }
                    
                    if storedemail != nil && storedPassword != nil
                    {
                        if email == storedemail! && storedPassword! == password
                        {
                            return true
                        }
                    }
                }
            }
            catch let error as NSError
            {
                alert("Falha ao cadastrar dado", "Erro ao acessar dados. \(error)")
                print("Erro ao acessar dados. \(error)")
                return false
            }
            alert("Falha ao cadastrar dado", "Email ou senha inválido")
            return false
        }

}

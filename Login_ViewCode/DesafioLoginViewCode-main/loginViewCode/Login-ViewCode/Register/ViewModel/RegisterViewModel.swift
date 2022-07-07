//
//  RegisterViewModel.swift
//  Login-ViewCode
//
//  Created by Josicleison on 01/07/22.
//

import UIKit
import CoreData

protocol RegisterViewModel {
    
    func registerCoreData(_ email: String,
                          _ password: String) -> Error?
}

extension RegisterViewModel {
    
    func registerCoreData(_ email: String,
                          _ password: String) -> Error? {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return nil}
    
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
        
        let user = NSManagedObject(entity: entity, insertInto: managedContext)
        
        user.setValue(email, forKey: "email")
        user.setValue(password, forKey: "password")
            
        do {
            
            try managedContext.save()
        }
        catch let error as NSError {
            
            print("Erro ao registrar dados. \(error)")
            return error
        }
        return nil
    }
}

//
//  AlertUtils.swift
//  Login-ViewCode
//
//  Created by Josicleison on 01/07/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func alert(_ title: String,_ message: String) {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true, completion: nil)
    }
}

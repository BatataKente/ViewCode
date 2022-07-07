//
//  HomeView.swift
//  Login-ViewCode
//
//  Created by Josicleison on 01/07/22.
//

import UIKit

class HomeView: HomeViewElements, APIEater {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        setup()
        advicer()
    }
}

extension HomeView: ViewCode {
    
    func buildViewHierarchy() {
        
        view.addSubview(homeLabel)
    }
    
    func addConstraints() {
        
        homeLabel.fillSuperview()
    }
}

extension HomeView {
    
    func advicer() {
        
        for x in 0..<10000 {
                    
            DispatchQueue.main.asyncAfter(deadline: .now()+(10 * TimeInterval(x))) {
                
                self.APIRequest {advice, error in
                    
                    if let advice = advice {
                        
                        self.homeLabel.text = advice.slip.advice
                    }
                    else {
                        
                        if let error = error {
                            
                            self.alert("Falha", "Erro: \(error)")
                        }
                    }
                }
            }
        }
    }
}

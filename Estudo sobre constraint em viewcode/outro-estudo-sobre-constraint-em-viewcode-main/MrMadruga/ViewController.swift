//
//  ViewController.swift
//  MrMadruga
//
//  Created by Josicleison on 04/07/22.
//

import UIKit

class ViewController: UIViewController {

    let mrMadruga: UILabel = {
        
        let mrMadruga = UILabel()
        mrMadruga.text = "Toma!!"
        mrMadruga.backgroundColor = .separator
        
        return mrMadruga
    }()
    
    let otraLabel: UILabel = {
        
        let otraLabel = UILabel()
        otraLabel.text = "Toma!!"
        otraLabel.backgroundColor = .separator
        
        return otraLabel
    }()
    
    let madruguinha: UIImageView = {
        
        let madruguinha = UIImageView()
        madruguinha.backgroundColor = .black
        madruguinha.image = UIImage(named: "MrMadruga")
        
        return madruguinha
    }()
    
    let terceiraLabel: UILabel = {
        
        let terceiraLabel = UILabel()
        terceiraLabel.backgroundColor = .black
        terceiraLabel.textColor = .white
        terceiraLabel.text = "Toma!!"
        
        return terceiraLabel
    }()
    
    let quartaLabel: UILabel = {
        
        let quartaLabel = UILabel()
        quartaLabel.backgroundColor = .black
        quartaLabel.textColor = .white
        quartaLabel.text = "Toma!!"
        
        return quartaLabel
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.addSubview(terceiraLabel)
        view.addSubview(mrMadruga)
        view.addSubview(otraLabel)
        view.addSubview(madruguinha)
        
        view.addConstraints([mrMadruga.constraintIncideItem(view, .top, 50),
                             mrMadruga.constraintIncideItem(view, .leading, 0),
                             
                             madruguinha.constraintToItem(mrMadruga, .centerX, 0),
                             madruguinha.constraintIncideItem(view, .centerY, 0),
                            
                             madruguinha.heightAnchor.constraint(equalToConstant: 150),
                             madruguinha.widthAnchor.constraint(equalToConstant: 150)])
    }
}

extension UIView {
    
    func constraintIncideItem(_ item: Any?,
                              _ attribute: NSLayoutConstraint.Attribute,
                              _ constant: CGFloat) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        
        return NSLayoutConstraint(item: self,
                                  attribute: attribute,
                                  relatedBy: .equal,
                                  toItem: item,
                                  attribute: attribute,
                                  multiplier: 1,
                                  constant: constant)
    }
    
    func constraintToItem(_ item: Any?,
                          _ itemAttribute: NSLayoutConstraint.Attribute,
                          _ constant: CGFloat) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        
        var attribute: NSLayoutConstraint.Attribute
        
        switch itemAttribute {
            
            case .top: attribute = .bottom
            case .bottom: attribute = .top
            case .leading: attribute = .trailing
            case .trailing: attribute = .leading
            case .topMargin: attribute = .bottomMargin
            case .bottomMargin: attribute = .topMargin
            case .leadingMargin: attribute = .trailingMargin
            case .trailingMargin: attribute = .leadingMargin
            case .centerX: attribute = .centerX
            case .centerY: attribute = .centerY
            default: return NSLayoutConstraint()
        }
        
        return NSLayoutConstraint(item: self,
                                  attribute: attribute,
                                  relatedBy: .equal,
                                  toItem: item,
                                  attribute: itemAttribute,
                                  multiplier: 1,
                                  constant: constant)
    }
}

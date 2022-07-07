//
//  View+Constraints.swift
//  JokenpoViewCode2.0
//
//  Created by Josicleison on 06/07/22.
//

import UIKit

extension UIView {
    
    open func sizeAnchorInSuperview(_ constant: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        superview?.addConstraint(self.heightAnchor.constraint(equalToConstant: constant))
        superview?.addConstraint(self.widthAnchor.constraint(equalToConstant: constant))
    }
    
    open func constraintToItemIncide(_ attribute: NSLayoutConstraint.Attribute,
                                     _ toItem: Any?,
                                     _ constant: CGFloat = 0) -> NSLayoutConstraint {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        return NSLayoutConstraint(item: self,
                                  attribute: attribute,
                                  relatedBy: .equal,
                                  toItem: toItem,
                                  attribute: attribute,
                                  multiplier: 1,
                                  constant: constant)
    }
    
    open func constraintToItemOutside(_ attribute: NSLayoutConstraint.Attribute,
                                      _ toItem: Any?,
                                      _ constant: CGFloat = 0) -> NSLayoutConstraint {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        var itemAttribute: NSLayoutConstraint.Attribute
        
        switch attribute {
            
            case .top: itemAttribute = .bottom
            
            case .bottom: itemAttribute = .top
            
            case .leading: itemAttribute = .trailing
            
            case .trailing: itemAttribute = .leading
            
            case .centerX: itemAttribute = .centerX
            
            case .centerY: itemAttribute = .centerY
            
            default: return NSLayoutConstraint()
        }
        
        return NSLayoutConstraint(item: self,
                                  attribute: attribute,
                                  relatedBy: .equal,
                                  toItem: toItem,
                                  attribute: itemAttribute,
                                  multiplier: 1,
                                  constant: constant)
    }
    
    open func addSubviews(_ views: [UIView]) {
        
        for view in views {
            
            self.addSubview(view)
        }
    }
}

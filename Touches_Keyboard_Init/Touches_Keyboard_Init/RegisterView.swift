//
//  RegisterView.swift
//  Testes
//
//  Created by Josicleison on 17/07/22.
//

import UIKit

extension UIButton {
    
    convenience init(image: UIImage?) {
        
        self.init(frame: .zero)
        self.setImage(image, for: .normal)
    }
    
    convenience init(title: String?) {
        
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
    }
    
    convenience init(image: UIImage?, title: String?) {
        
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setImage(image, for: .normal)
    }
}

extension UILabel {
    
    convenience init(text: String) {
        
        self.init(frame: .zero)
        self.text = text
    }
}

extension UITextField {
    
    convenience init(isHidden: Bool) {
        
        self.init(frame: .zero)
        self.isHidden = isHidden
    }
}

extension UIView {
    
    open func sizeAnchor(_ constant: CGFloat) -> [NSLayoutConstraint] {
        
        return [self.heightAnchor.constraint(equalToConstant: constant),
                self.widthAnchor.constraint(equalToConstant: constant)]
    }
    
    open func constraintIncideTo(_ attribute: NSLayoutConstraint.Attribute,
                                 _ toItem: Any?,
                                 _ constant: CGFloat = 0,
                                 multiplier: CGFloat = 1) -> NSLayoutConstraint {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if attribute == .bottom || attribute == .trailing {
            
            return NSLayoutConstraint(item: self,
                                      attribute: attribute,
                                      relatedBy: .equal,
                                      toItem: toItem,
                                      attribute: attribute,
                                      multiplier: multiplier,
                                      constant: -constant)
        }
        
        return NSLayoutConstraint(item: self,
                                  attribute: attribute,
                                  relatedBy: .equal,
                                  toItem: toItem,
                                  attribute: attribute,
                                  multiplier: multiplier,
                                  constant: constant)
    }
    
    open func constraintOutcideTo(_ attribute: NSLayoutConstraint.Attribute,
                                  _ toItem: Any?,
                                  _ constant: CGFloat = 0,
                                  multiplier: CGFloat = 1) -> NSLayoutConstraint {
         
        translatesAutoresizingMaskIntoConstraints = false
        
        let itemAttribute: NSLayoutConstraint.Attribute
        
        switch attribute {
            
        case .top: itemAttribute = .bottom
        case .trailing: itemAttribute = .leading
        case .leading: itemAttribute = .trailing
        case .bottom: itemAttribute = .top
            default: return NSLayoutConstraint()
        }
        
        if attribute == .bottom || attribute == .trailing {
            
            return NSLayoutConstraint(item: self,
                                      attribute: attribute,
                                      relatedBy: .equal,
                                      toItem: toItem,
                                      attribute: itemAttribute,
                                      multiplier: multiplier,
                                      constant: -constant)
        }
        
        return NSLayoutConstraint(item: self,
                                  attribute: attribute,
                                  relatedBy: .equal,
                                  toItem: toItem,
                                  attribute: itemAttribute,
                                  multiplier: multiplier,
                                  constant: constant)
    }
}

extension UIView {
    
    func addSubviews(_ views: [UIView]) {
        
        for view in views {
            
            self.addSubview(view)
        }
    }
}

extension UIView {

    func addBottomLineWithColor(color: UIColor = .gray, width: CGFloat = 0.8) {

        let bottomBorderLine = CALayer()
        bottomBorderLine.backgroundColor = color.cgColor
        bottomBorderLine.frame = CGRect(x: 0,
                                        y: self.frame.size.height - width,
                                        width: self.frame.size.width,
                                        height: width)

        self.layer.addSublayer(bottomBorderLine)
    }
}

class RegisterView: UIViewController {
    
    let backButton = UIButton(image: UIImage(systemName: "chevron.left"))
    
    let bravveIcon = UIImageView(image: UIImage(named: "logoNextGreen"))
    
    let stackView: UIStackView = {
        
        let personalData = UIButton(image: UIImage(systemName: "chevron.left"),
                                    title: "Dados pessoais")
        let stackView = UIStackView(arrangedSubviews: [personalData])
        
        return stackView
    }()
    
    let infoLabel: UILabel = {
        
        let infoLabel = UILabel(text: "Para come;armos a conversar, pode nos contar seu nome e sobrenome!")
        infoLabel.numberOfLines = 0
        infoLabel.textAlignment = .center
        
        return infoLabel
    }()
    
    let registerStackView: (stack: UIStackView, textField: UITextField) = {
        
        let registerLabel = UILabel(text: "Nome Completo")
        let registerTextField = UITextField(isHidden: true)
        let registerStackView = UIStackView(arrangedSubviews: [registerLabel,
                                                               registerTextField])
        registerStackView.axis = .vertical
        registerStackView.backgroundColor = .red
        
        return (stack: registerStackView, textField: registerTextField)
    }()
    
    let registerButton: UIButton = {
        
        let registerButton = UIButton(title: "Continuar")
        registerButton.titleLabel?.textColor = .white
        registerButton.backgroundColor = .gray
        
        return registerButton
    }()
    
    lazy var constraints = [
    
        backButton.constraintIncideTo(.top, view.safeAreaLayoutGuide, 20),
        backButton.constraintIncideTo(.leading, view.safeAreaLayoutGuide, 20),
        
        bravveIcon.constraintIncideTo(.centerX, view.safeAreaLayoutGuide),
        bravveIcon.constraintIncideTo(.centerY, backButton),
        bravveIcon.heightAnchor.constraint(equalToConstant: 30),
        bravveIcon.widthAnchor.constraint(equalToConstant: 55),
        
        stackView.constraintOutcideTo(.top, bravveIcon, 50),
        stackView.constraintIncideTo(.leading, view.safeAreaLayoutGuide, 40),
        stackView.constraintIncideTo(.trailing, view.safeAreaLayoutGuide, 40),
        stackView.heightAnchor.constraint(equalToConstant: 32),
        
        infoLabel.constraintOutcideTo(.top, stackView, 50),
        infoLabel.constraintIncideTo(.leading, view.safeAreaLayoutGuide, 40),
        infoLabel.constraintIncideTo(.trailing, view.safeAreaLayoutGuide, 40),
        
        registerStackView.stack.constraintOutcideTo(.top, infoLabel, 50),
        registerStackView.stack.constraintIncideTo(.leading, view.safeAreaLayoutGuide, 20),
        registerStackView.stack.constraintIncideTo(.trailing, view.safeAreaLayoutGuide, 20),
        
        registerButton.constraintIncideTo(.leading, view.safeAreaLayoutGuide),
        registerButton.constraintIncideTo(.trailing, view.safeAreaLayoutGuide),
        registerButton.constraintOutcideTo(.bottom, view.keyboardLayoutGuide)
    ]
    
    override func viewDidLoad() {
        
        view.addSubviews([backButton, bravveIcon, stackView, infoLabel, registerStackView.stack, registerButton])
        stackView.backgroundColor = .red
        
        view.addConstraints(constraints)
        
        view.backgroundColor = .white
        
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        registerButton.backgroundColor = .red
        registerStackView.textField.isHidden = false
    }
}

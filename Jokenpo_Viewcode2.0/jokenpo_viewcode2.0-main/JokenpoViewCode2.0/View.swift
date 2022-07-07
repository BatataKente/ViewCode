//
//  ViewController.swift
//  JokenpoViewCode2.0
//
//  Created by Josicleison on 06/07/22.
//

import UIKit

class View: ViewModel {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.addSubviews([titleLabel, buttonsStackView, playStackView, scoreStackView])
        
        stoneButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        paperButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        scissorsButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        view.backgroundColor = .purple
        
        setupConstraints()
    }
    
    @objc func buttonAction(_ sender: UIButton) {
        
        play(sender)
    }
}

extension View {
    
    func setupConstraints() {
        
        view.addConstraints([titleLabel.constraintToItemIncide(.top, view.safeAreaLayoutGuide),
                             titleLabel.constraintToItemIncide(.centerX, view),
                            
                             buttonsStackView.constraintToItemOutside(.top, titleLabel, 20),
                             buttonsStackView.constraintToItemIncide(.centerX, view),
                            
                             playStackView.constraintToItemOutside(.top, buttonsStackView, 20),
                             playStackView.constraintToItemIncide(.centerX, view),
                            
                             scoreStackView.constraintToItemOutside(.top, playStackView, 20),
                             scoreStackView.constraintToItemIncide(.leading, view, 20),
                             scoreStackView.constraintToItemIncide(.trailing, view, -20)])
        
        playerActionEffect.sizeAnchorInSuperview(128)
        cpuActionEffect.sizeAnchorInSuperview(128)
        
        stoneButton.sizeAnchorInSuperview(64)
        paperButton.sizeAnchorInSuperview(64)
        scissorsButton.sizeAnchorInSuperview(64)
    }
}

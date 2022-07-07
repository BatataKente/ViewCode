//
//  ViewElements.swift
//  JokenpoViewCode2.0
//
//  Created by Josicleison on 06/07/22.
//

import UIKit

class ViewElements: UIViewController {
    
    let titleLabel: UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 40,
                                            weight: .bold)
        titleLabel.textColor = .white
        titleLabel.text = "Jokenpo"
        
        return titleLabel
    }()
    
    let stoneButton: UIButton = {
        
        let stoneButton = UIButton()
        stoneButton.setImage(UIImage(named: "0"), for: .normal)
        
        return stoneButton
    }()
    
    let paperButton: UIButton = {
        
        let paperButton = UIButton()
        paperButton.setImage(UIImage(named: "1"), for: .normal)
        
        return paperButton
    }()
    
    let scissorsButton: UIButton = {
        
        let scissorsButton = UIButton()
        scissorsButton.setImage(UIImage(named: "2"), for: .normal)
        
        return scissorsButton
    }()
    
    lazy var buttonsStackView: UIStackView = {
        
        let buttonsStackView = UIStackView(arrangedSubviews: [stoneButton,
                                                              paperButton,
                                                              scissorsButton])
        return buttonsStackView
    }()
    
    let playerActionEffect: UIImageView = {
        
        let playerActionEffect = UIImageView()
        
        return playerActionEffect
    }()
    
    let versusLabel: UILabel = {
        
        let versusLabel = UILabel()
        versusLabel.textColor = .white
        versusLabel.font = UIFont.systemFont(ofSize: 25,
                                             weight: .bold)
        versusLabel.text = "VS"
        versusLabel.textAlignment = .center
        
        return versusLabel
    }()
    
    let cpuActionEffect: UIImageView = {
        
        let cpuActionEffect = UIImageView()
        
        return cpuActionEffect
    }()
    
    lazy var playStackView: UIStackView = {
        
        let playStackView = UIStackView(arrangedSubviews: [playerActionEffect,
                                                           versusLabel,
                                                           cpuActionEffect])
        playStackView.spacing = 20
        playStackView.axis = .vertical
        
        return playStackView
    }()
    
    let victoryLabel: UILabel = {
        
        let victoryLabel = UILabel()
        victoryLabel.font = UIFont.systemFont(ofSize: 25,
                                            weight: .bold)
        victoryLabel.textColor = .white
        victoryLabel.textAlignment = .left
        victoryLabel.text = "Win: 0"
        
        return victoryLabel
    }()
    
    let drawLabel: UILabel = {
        
        let drawLabel = UILabel()
        drawLabel.font = UIFont.systemFont(ofSize: 25,
                                            weight: .bold)
        drawLabel.textColor = .white
        drawLabel.textAlignment = .center
        drawLabel.text = "Draw: 0"
        
        return drawLabel
    }()
    
    let loseLabel: UILabel = {
        
        let loseLabel = UILabel()
        loseLabel.font = UIFont.systemFont(ofSize: 25,
                                            weight: .bold)
        loseLabel.textColor = .white
        loseLabel.textAlignment = .right
        loseLabel.text = "Lose: 0"
        
        return loseLabel
    }()
    
    lazy var scoreStackView: UIStackView = {
        
        let scoreStackView = UIStackView(arrangedSubviews: [victoryLabel,
                                                           drawLabel,
                                                           loseLabel])
        scoreStackView.distribution = .fillEqually
        return scoreStackView
    }()
}

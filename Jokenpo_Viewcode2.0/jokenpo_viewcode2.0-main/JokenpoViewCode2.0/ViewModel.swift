//
//  ViewModel.swift
//  JokenpoViewCode2.0
//
//  Created by Josicleison on 06/07/22.
//

import UIKit

class ViewModel: ViewElements {
    
    var victory = 0
    var draw = 0
    var lose = 0
    
    func cpuPlay() -> Int {
        
        return Int.random(in: 0...2)
    }
    
    func victoryResult(_ player: Int,_ cpu: Int) -> Bool
    {
        switch player
        {
            case 0:
            if cpu == 2
            {
                return true
            }
            case 1:
            if cpu == 0
            {
                return true
            }
            default:
            if cpu == 1
            {
                return true
            }
        }
        return false
    }
    
    func playerPlay(_ image: UIImage) -> Int
    {
        switch image
        {
            case UIImage(named: "0"):
            
                return 0
            
            case UIImage(named: "1"):
            
                return 1
            
            default:
            
                return 2
        }
    }
    
    func play(_ sender: UIButton) {
        
        let cpu = cpuPlay()
        let player = playerPlay(sender.currentImage ?? UIImage())
    
        playerActionEffect.image = sender.currentImage
        cpuActionEffect.image = UIImage(named: String(cpu))
        
        if victoryResult(player, cpu) {
            
            victory += 1
            victoryLabel.text = "Win: \(victory)"
        }
        else if player == cpu {
            
            draw += 1
            drawLabel.text = "Draw: \(draw)"
        }
        else {
            
            lose += 1
            loseLabel.text = "Lose: \(lose)"
        }
    }
}

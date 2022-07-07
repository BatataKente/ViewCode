//
//  APIModel.swift
//  Login-ViewCode
//
//  Created by Josicleison on 01/07/22.
//

import Foundation

struct Advice: Codable {
    
    let slip: Slip
}

struct Slip: Codable {
    
    let id: Int
    let advice: String
}

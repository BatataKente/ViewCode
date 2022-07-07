//
//  APIEater.swift
//  Login-ViewCode
//
//  Created by Josicleison on 01/07/22.
//

import Foundation
import Alamofire

protocol APIEater {
    
    func APIRequest(completion: @escaping (Advice?,Error?) -> Void)
}

extension APIEater {
    
    func APIRequest(completion: @escaping (Advice?,Error?) -> Void) {

        let url = "https://api.adviceslip.com/advice"

        AF.request(url).responseJSON {response in

            if let data = response.data {

                do {
                    let user: Advice = try JSONDecoder().decode(Advice.self, from: data)

                    completion(user,nil)
                }
                catch {

                    completion(nil,error)
                }
            }
        }
    }
}

//
//  UserModel.swift
//  ArquiteturaSwift
//
//  Created by Wagner Rodrigues on 03/12/22.
//

import Foundation

struct UserModel: Codable{
    let email: String
    let password: String
    
    init(){
        self.email = String()
        self.password = String()
    }
    
    init(email: String, password: String){
        self.email = email
        self.password = password
    }
}

//
//  UserManager.swift
//  ArquiteturaSwift
//
//  Created by Wagner Rodrigues on 05/12/22.
//

import Foundation

protocol UserManagerProtocol {
    func register(email: String,
                 passowrd: String,
                 successHandler: @escaping(UserModel) -> Void,
                 failureHandler: @escaping(Error?) -> Void)
    
    func login(email: String,
              password: String,
              successHandler: @escaping(UserModel) -> Void,
              failureHandler: @escaping(Error?) -> Void)
}

class UserManager: UserManagerProtocol {
    
    let business: UserBusinessProtocol
    
    init(business: UserBusinessProtocol){
        self.business = business
    }
    
    func login(email: String, password: String,
              successHandler: @escaping (UserModel) -> Void,
              failureHandler: @escaping (Error?) -> Void) {
        business.login(email: email, password: password) { result in
            switch result{
                
            case .success(let userModel):
                successHandler(userModel)
            
            case .failure(let error):
                failureHandler(error)
            }
        }
    }
    
    func register(email: String,
                 passowrd: String,
                 successHandler: @escaping (UserModel) -> Void,
                 failureHandler: @escaping (Error?) -> Void) {
        business.register(email: email, password: passowrd) { result in
            switch result{
            case .success(let userModel):
                successHandler(userModel)
            
            case .failure(let error):
                failureHandler(error)
                
            }
        }
    }
    
}


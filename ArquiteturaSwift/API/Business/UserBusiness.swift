//
//  UserBusiness.swift
//  ArquiteturaSwift
//
//  Created by Wagner Rodrigues on 05/12/22.
//

import Foundation

protocol UserBusinessProtocol {
    func register(email: String, password: String, completionHandler: @escaping (Result<UserModel, Error>) -> Void)
    func login(email: String, password: String, completionHandler: @escaping (Result<UserModel, Error>) -> Void)
}

class UserBusiness: UserBusinessProtocol{
    let provider: UserProvider = UserProvider()
    
    func login(email: String, password: String, completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        provider.login(paramter: getParams(email, password)) {result in
            switch result {
                
            case .success(let userModel):
                completionHandler(.success(userModel))
                
            case .failure(let error):
                completionHandler( .failure(error))
                
            }
        }
    }
    
    func register(email: String, password: String, completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        provider.register(paramter: getParams(email, password)) { result in
            switch result{
            case .success(let userModel):
                completionHandler(.success(userModel))
                
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    private func getParams(_ email: String, _ password: String) -> [AnyHashable: Any] {
        let userModel = UserModel(email: email, password: password)
        let params: [AnyHashable: Any] = [Constants.ParameterKeys.body: [Constants.ParameterKeys.userModel: userModel]]
        
        return params
    }
    
}

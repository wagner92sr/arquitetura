//
//  UserProvider.swift
//  ArquiteturaSwift
//
//  Created by Wagner Rodrigues on 03/12/22.
//

import Foundation
import FirebaseAuth

protocol UserProviderProtocol {
    func login(paramter: [AnyHashable: Any], completionHandler: @escaping(Result<UserModel, Error>) -> Void)

    
    func register(paramter: [AnyHashable: Any], completionHandler: @escaping(Result<UserModel, Error>) -> Void)
        
}

class UserProvider: UserProviderProtocol{
    lazy var auth = Auth.auth()
    
    func login(paramter: [AnyHashable : Any], completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        let body: NSDictionary = paramter[Constants.ParameterKeys.body] as! NSDictionary
        let userModel = body[Constants.ParameterKeys.userModel] as! UserModel
        
        self.auth.signIn(withEmail: userModel.email, password: userModel.password ) { (result, error) in
            if let error = error {
                completionHandler(.failure(error))
            }else {
                completionHandler(.success(<#T##UserModel#>))
            }
        }
    }
    
    func register(paramter: [AnyHashable : Any], completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        let body: NSDictionary = paramter[Constants.ParameterKeys.body] as! NSDictionary
        let userModel = body[Constants.ParameterKeys.userModel] as! UserModel

        
        self.auth.createUser(withEmail: userModel.email, password: userModel.password) { (result, error) in
            if let error = error {
                completionHandler(.failure(error))
            }else {
                completionHandler(.success(<#T##UserModel#>))
            }
        }
    }
    
    
}

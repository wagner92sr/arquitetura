//
//  ArquiteturaSwiftTests.swift
//  ArquiteturaSwift
//
//  Created by Wagner Rodrigues on 12/12/22.
//

import Foundation
import XCTest
@testable import ArquiteturaSwift

final class ArquiteturaSwiftTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRegister() throws {
        let manager = UserManager(business: UserBusiness())
        
        manager.register(email: "teste@teste.com",
                         passowrd: "teste12345") { userModel in
            print(userModel)
        }  failureHandler: { error in
            print(error)
        }
        
        manager.register(email: "teste@teste.com",
                        passowrd: "22") { userModel in
                                              print(userModel)
                                          } failureHandler: { error in
                                              print(error)
                                          }
        
        manager.register(email: "teste",
                         passowrd: "teste12345") { userModel in
                             print(userModel)
                         } failureHandler: { error in
                             print(error)
                         }
                         
    }
    
    func testLogin() throws {
        let manager = UserManager(business: UserBusiness())
            
            manager.login(email: "aaa",
                          password: "aaa") { UserModel in
                print(userModel)
            }failureHandler: {error in
                print(error)
            }
        
        manager.login(email: "aaa@teste.com",
                      password: "teste123") { UserModel in
            print(userModel)
        }failureHandler: {
            error in
            print(error)
        }
        
        
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

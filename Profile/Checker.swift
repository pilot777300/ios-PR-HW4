//
//  Checker.swift
//  NavigTest
//
//  Created by Mac on 13.10.2022.
//

import Foundation
import UIKit

final class Checker {
    
    static let shared = Checker()
    private init() {}
    
  private  let login: String = "user"
   private  let password: String = "pass"

    
    func check( login:String, password: String) -> Bool {
      return  login == Checker.shared.login && password == Checker.shared.password
    }
}

protocol LoginViewControllerDelegate {
   func check( login:String, password: String) -> Bool
   
}

struct LoginInspector: LoginViewControllerDelegate {

    func check(login: String, password: String) -> Bool {
        let v = Checker.shared.check(login: login, password: password)
       return v
    }
}

protocol Loginfactory {
    func makeLoginInspector() -> LoginInspector
}

struct MyLoginFactory:Loginfactory {
    func makeLoginInspector() -> LoginInspector {
        LoginInspector()
        }
    }


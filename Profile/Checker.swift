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
    
   private let login: String = "user"
     let password: String = "password"

    
    func check( login:String, password: String) -> Bool {
        let login = Checker.shared.login
        let password = Checker.shared.password
        
    if (login == login && password == password) {
            return true
        }
      return false
    }
}

protocol LoginViewControllerDelegate {
   func check( login:String, password: String) -> Bool
}

struct LoginInspector: LoginViewControllerDelegate {

    func check(login: String, password: String) -> Bool {
        let x = LogInViewController()
    if (Checker.shared.check(login: x.email.text ?? "no data", password: x.password.text ?? "no data"))
        {
        return  true
    } 
  return false
    }
}

protocol Loginfactory {
    func makeLoginInspector() -> LoginInspector?
}

struct MyLoginFactory:Loginfactory {
    func makeLoginInspector() -> LoginInspector? {
        let e = LogInViewController()
        let pass = Checker.shared.password
        if e.password.text == pass {
        return LoginInspector()
        }
        return nil
        }
    }

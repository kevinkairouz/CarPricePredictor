//
//  logicManager.swift
//  finalProject
//
//  Created by Kev on 1/13/26.
//

import Foundation


final class logicManager{
    
    func validEmail(email: String) -> Bool {
        
        if email.trimmingCharacters(in: .whitespaces).isEmpty == false && email.contains("@"){
            return true
        }
        else{
            return false
        }
        
    }
    
    func validPassword(password: String) -> Bool {
        
        let stringCount = password.count
        
        if stringCount >= 6{
            return true
        }
        else{
            return false
        }
  
    }
    
    
    
}

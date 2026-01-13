//
//  authenticationManager.swift
//  finalProject
//
//  Created by Kev on 1/13/26.
//

import Foundation
import Supabase


//MARK: May change String returns in function header to Bool to make auth bugs easier to detect


final class authManager{
    
    var logicHelper = logicManager()
    
    let link = "https://fitvglyfcbejboduqbes.supabase.co"
    
    
    let client = SupabaseClient(supabaseURL: URL(string: "https://fitvglyfcbejboduqbes.supabase.co")!, supabaseKey: "sb_publishable_lSmcWJUZYvYtVE0p2hra9Q_VdYhTKOf")
    
    
    func signIn(email: String, password: String) async throws -> String {
        
        
        do{
            try await client.auth.signIn(email: email, password: password)
            print("Success")
            return "Successful Sign-In"
        }
        catch{
            print(error.localizedDescription)
            return "Something went wrong"
        }
    }
    
    func signUp(email: String, password: String) async throws -> String {
        
        if logicHelper.validEmail(email: email) == true && logicHelper.validPassword(password: password) == true {
            
            do{
                try await client.auth.signUp(email: email, password: password)
                return "Sucessful Sign Up"
                
            }
            catch{
                print(error.localizedDescription)
                return "Something went wrong"
            }
            
            
        }
        else{
            return "Did not pass validation for sign up"
        }
        
    }
    
    func signOut() async throws -> String {
        do{
            try await client.auth.signOut()
            return "Sign-Out Sucessful"
        }
        catch{
            print(error.localizedDescription)
            return "Something went wrong"
            
        }
    }
    
    
    
    
    
}
    
    
    



    
    
    
    


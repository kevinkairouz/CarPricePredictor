//
//  authenticationManager.swift
//  finalProject
//
//  Created by Kev on 1/13/26.
//

import Foundation
import Supabase
import Combine


//MARK: May change String returns in function header to Bool to make auth bugs easier to detect


final class authManager: ObservableObject {
    
    var logicHelper = logicManager()
    
    let link = "https://fitvglyfcbejboduqbes.supabase.co"
    
    
    let client = SupabaseClient(supabaseURL: URL(string: "https://fitvglyfcbejboduqbes.supabase.co")!, supabaseKey: "sb_publishable_lSmcWJUZYvYtVE0p2hra9Q_VdYhTKOf")
    
    
    func signIn(email: String, password: String) async throws -> Bool {
        
        
        do{
            try await client.auth.signIn(email: email, password: password)
            print("Success")
            return true
        }
        catch{
            print(error.localizedDescription)
            return false
        }
    }
    
    func signUp(email: String, password: String) async throws -> Bool {
        
        if logicHelper.validEmail(email: email) == true && logicHelper.validPassword(password: password) == true {
            
            do{
                try await client.auth.signUp(email: email, password: password)
                return true
                
            }
            catch{
                print(error.localizedDescription)
                return false
            }
            
            
        }
        else{
            return false
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
    
    
    



    
    
    
    


//
//  databaseManager.swift
//  finalProject
//
//  Created by Kev on 1/16/26.
//

import Foundation
import Combine
import Supabase

struct r: Codable {
    let brand: String
    let miles: Int
    let year: Int
}

struct p: Codable{
    let amount: Float
}

struct c: Codable{
    let brand: String
    let year: Int
}

struct cList: Codable{
    let info: [c]
}




class DatabaseManager: ObservableObject {
    
    private var auth = authManager()
    
    func sendCarInfo(info: r) async throws {
        do{
            try await auth.client.from("car_data").insert(info).execute()
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    func sendResult(price: p) async throws {
        try await auth.client.from("results").insert(price).execute()
    }
    
    func findOldestCar() async throws -> c {
        
        let res: [c] = try await auth.client.from("car_data").select("brand,year").order("year", ascending: true).limit(1).execute().value
        return res[0]
    }
    
    func findNewestCar() async throws -> c {
        let res: [c] = try await auth.client.from("car_data").select("brand,year").order("year", ascending: false).limit(1).execute().value
        return res[0]
        
    }
    
}


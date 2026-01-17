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
//
//enum projection: CodingKey {
//     Good:
//}
//considering enum for hey this is a good price

//considering


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
    
}

//
//  databaseManager.swift
//  finalProject
//
//  Created by Kev on 1/16/26.
//

import Foundation
import Combine
import Supabase


class DatabaseManager: authManager {
    
    
    func sendCarInfo(info: CarInfo) async throws {
        try await client.from("car_data").insert(info).execute()
    }
    
    func sendResult(price: Result) async throws {
        try await client.from("results").insert(price).execute()
    }
    
}

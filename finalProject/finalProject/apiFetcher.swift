//
//  apiFetcher.swift
//  finalProject
//
//  Created by Kev on 1/13/26.
//

import Foundation
import Combine

struct CarInfo: Codable{
    let Brand: String
    let Year: Int
    let EngineSize: Int
    let FuelType: String
    let Transmission: String
    let Mileage: Int
    let Condition: String
    let Model: String

}

struct Result: Codable{
    let price: Float
}


final class apiFetcher: ObservableObject{
    
    func fetchData(X: CarInfo) async throws -> Result {
        return Result(price: 1)
    }
    
    
    
    
}

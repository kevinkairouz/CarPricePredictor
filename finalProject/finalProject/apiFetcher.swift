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
    let Miles: Int

}

struct Result: Codable{
    let Price: Float
}


final class apiFetcher: ObservableObject{
    
    func fetchData(X: CarInfo) async throws -> Result {
        return Result(Price: 1)
    }
    
    
    
    
}

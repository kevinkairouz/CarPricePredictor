//
//  apiFetcher.swift
//  finalProject
//
//  Created by Kev on 1/13/26.
//

//MARK: may include api call to predict the car the person has as a bonus method 

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
        
    func fetchData(X: CarInfo) async throws -> Float {
        
        let url = URL(string: "http://127.0.0.1:5000/predict")!
        let (data, response) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let res = try decoder.decode(Result.self, from: data)
        return res.Price
        
    }
    
}

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
    
    let url = "http://127.0.0.1:5000/predict"
    func fetchData(X: CarInfo) async throws -> Float {
        
        let url = URL(string: url)!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let encoder = JSONEncoder()
        let data = try encoder.encode(X)
        request.httpBody = data
        let (d, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        let res = try decoder.decode(Result.self, from: d)
        return res.Price
    }
    
}

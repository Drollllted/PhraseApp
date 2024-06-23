//
//  APIRequest.swift
//  PhraseApp
//
//  Created by Drolllted on 19.06.2024.
//

import Foundation


class APIRequest {
    
    static let shared = APIRequest()
    static let apiKey = "er483/072QGJ8Y+cyVY9ZA==BtxTfeHFd2FLF6jx"
    
    private init() {}
    
    
    func getPhareses(for qoute: String?, completion: @escaping (String?) -> Void) {
        
        guard let qoute = qoute else {return}
        
        let category = qoute.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: "https://api.api-ninjas.com/v1/quotes?category="+category!)!
        
        var request = URLRequest(url: url)
        request.setValue(APIRequest.apiKey, forHTTPHeaderField: "X-Api-Key")
        
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
                    
            guard let data = data else { return }
            do{
                let decoder = JSONDecoder()
                let jsonDecoder = try decoder.decode([Qoute].self, from: data)
                if !jsonDecoder.isEmpty{
                    let quotes = jsonDecoder.first
                    guard let quotes = quotes else {return}
                    completion(quotes.quote)
                }
            }catch {
                debugPrint(error)

            }
            
        }
        task.resume()
        
    }
    
}

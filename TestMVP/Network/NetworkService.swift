//
//  NetworkService.swift
//  TestMVP
//
//  Created by Alexander Myskin on 27.12.2020.
//

import Foundation

protocol NetworkServiceProtocol {
    func getCommentsTest(complition: @escaping (Result<[TestComment],Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    static let shared = NetworkService()
    
    private init(){}
    
    
    func getCommentsTest(complition: @escaping (Result<[TestComment], Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url){ mydata, _ , error in
           
            if let error = error {
                complition(.failure(error))
                return
            }
            do {
                let commets = try JSONDecoder().decode([TestComment].self, from: mydata!)
                complition(.success(commets))
                
            } catch{
                complition(.failure(error))
            }
        }.resume()
    }
    
    
    func getMetod(path: String, queryItem: [URLQueryItem],_ callback: @escaping ( (Data) -> Void) ){
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "jsonplaceholder.typicode.com"
        components.path = path
        components.queryItems = queryItem
        
        
        guard let url = components.url else { return }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data , responce , eror in
            if let data = data{
                DispatchQueue.main.async {
                    callback(data)
                }
            }
            if let eror = eror {
                
                print("Ошибка загрузки данных!!! \n \(eror)")
            }
        }
        task.resume()
        
    }
    func getCommets(complition: @escaping ([TestComment]) -> Void){
        //print(#function)
        let queryArray: [URLQueryItem] = [
            // URLQueryItem(name: "v", value: "5.52"),
           // URLQueryItem(name: "fields", value: "photo_50"),
           // URLQueryItem(name: "access_token", value: session.token)
        ]
        getMetod(path: "/comments", queryItem: queryArray){jsonData in
            
            do {
                let response = try JSONDecoder().decode([TestComment].self, from: jsonData)
                
                complition(response)
                
            } catch {
                print(error)
                
            }
        }
        
    }
}

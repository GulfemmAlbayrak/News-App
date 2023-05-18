//
//  NewsService.swift
//  
//
//  Created by Gülfem Albayrak on 16.05.2023.
//

import Foundation
import Alamofire

public protocol NewsServiceProtocol: AnyObject {
    func getTopNews(completion: @escaping (Result<[News], Error>) -> Void)
}

public class NewsService: NewsServiceProtocol {

    public init() { }
    
    public func getTopNews(completion: @escaping (Result<[News], Error>) -> Void) {
        
        let apiKey = "EF0AST1GsfGVaGQEtNqj5Ac88oPry7Dh"
        let baseUrlString = "https://api.nytimes.com/svc/topstories/v2"
        
        let urlString = "\(baseUrlString)/home.json?api-key=\(apiKey)"
        
        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let data):
                let decoder = Decoders.dateDecoder
                do {
                    let response = try decoder.decode(NewsResponse.self, from: data)
                    completion(.success(response.results))
                } catch {
                    print("JSON decode error")
                }
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
}


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
//}
//enum NetworkError: Error {
//    case noDataAvailable
//    case cannotProcessData
//}
//
//struct NetworkCaller {
//    static let shared = NetworkCaller()
//    
//     let apiKey = "EF0AST1GsfGVaGQEtNqj5Ac88oPry7Dh"
//     let baseUrlString = "https://api.nytimes.com/svc/topstories/v2"
//    
//    private var topHeadlinesUrl: URL? {
//        let urlString = "\(baseUrlString)/home.json?api-key=\(apiKey)"
//        return URL(string: urlString)
//    }
//    
//    func getTopStories(completion: @escaping (Result<[NewsResult], NetworkError>) -> Void) {
//        guard let url = topHeadlinesUrl else {
//            completion(.failure(.cannotProcessData))
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil else {
//                completion(.failure(.noDataAvailable))
//                return
//            }
//            
//            do {
//                let response = try JSONDecoder().decode(News.self, from: data)
//                completion(.success(response.results!))
//            } catch {
//                completion(.failure(.cannotProcessData))
//            }
//        }
//        
//        task.resume()
//    }
//}

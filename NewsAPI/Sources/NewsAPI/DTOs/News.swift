//
//  News.swift
//  
//
//  Created by Gülfem Albayrak on 16.05.2023.
//

import Foundation
 
// MARK: - News
public struct NewsResult: Decodable {
   public let results: [News]?
}

// MARK: - Result
public struct News: Decodable {
    public let title: String?
    public let abstract: String?
    public let url: String?
   public let byline: String?
    //let publishedDate: Date?
    public let multimedia: [Multimedia]?

//    enum CodingKeys: String, CodingKey {
//        case title, abstract, url, byline, multimedia
//        case publishedDate = "published_date"
//    }
}

// MARK: - Multimedia
public struct Multimedia: Decodable {
    public let url: String?
}

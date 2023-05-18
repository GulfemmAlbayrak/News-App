//
//  Decoders.swift
//  
//
//  Created by Gülfem Albayrak on 16.05.2023.
//

import Foundation

public enum Decoders {
    static let dateDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()
}

public enum DateFormatters {
    public static func mediumStyleFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        return dateFormatter
    }
}

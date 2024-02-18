//
//  Constants.swift
//  NewsApp
//
//  Created by joe on 2/18/24.
//

import Foundation

struct Constants {
    struct Urls {
        static func topHeadlines(by source: String) -> URL? {
            return URL(string: "https://newsapi.org/v2/top-headlines?sources=\(source)&apiKey=\(apiKey)")
        }
                
        static let sources: URL? = URL(string: "https://newsapi.org/v2/sources?apiKey=\(apiKey)")
    }
}

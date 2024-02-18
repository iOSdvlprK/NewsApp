//
//  NewsSource.swift
//  NewsApp
//
//  Created by joe on 2/18/24.
//

import Foundation

struct NewsSourceResponse: Decodable {
    let sources: [NewsSource]
}

struct NewsSource: Decodable {
    let id: String
    let name: String
    let description: String
}

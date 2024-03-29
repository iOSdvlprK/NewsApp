//
//  NewsArticleListViewModel.swift
//  NewsApp
//
//  Created by joe on 2/18/24.
//

import Foundation

@MainActor
class NewsArticleListViewModel: ObservableObject {
    @Published var newsArticles = [NewsArticleViewModel]()
    
    func getNewsBy(sourceId: String) async {
        do {
            let newsArticles = try await Webservice().fetchNews(sourceId: sourceId, url: Constants.Urls.topHeadlines(by: sourceId))
            self.newsArticles = newsArticles.map(NewsArticleViewModel.init)
        } catch {
            print(error)
        }
        
        /*
        Webservice().fetchNews(by: sourceId, url: Constants.Urls.topHeadlines(by: sourceId)) { result in
            switch result {
                case .success(let newsArticles):
                    DispatchQueue.main.async {
                        self.newsArticles = newsArticles.map(NewsArticleViewModel.init)
                    }
                case .failure(let error):
                    print(error)
            }
        } */
    }
}

struct NewsArticleViewModel {
    let id = UUID()
    fileprivate let newsArticle: NewsArticle
    
    var title: String {
        newsArticle.title
    }
    
    var description: String {
        newsArticle.description ?? ""
    }
    
    var author: String {
        newsArticle.author ?? ""
    }
    
    var urlToImage: URL? {
        URL(string: newsArticle.urlToImage ?? "")
    }
}

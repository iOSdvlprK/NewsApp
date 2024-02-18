//
//  NewsSourceListScreen.swift
//  NewsApp
//
//  Created by joe on 2/18/24.
//

import SwiftUI

struct NewsSourceListScreen: View {
    @StateObject private var newsSourceListViewModel = NewsSourceListViewModel()
    
    var body: some View {
        NavigationView {
            List(newsSourceListViewModel.newsSources, id: \.id) { newsSource in
                NavigationLink(destination: NewsListScreen(newsSource: newsSource)) {
                    NewsSourceCell(newsSource: newsSource)
                }
            }
            .listStyle(.plain)
            .onAppear {
                newsSourceListViewModel.getSources()
            }
            .navigationTitle("News Sources")
            .navigationBarItems(trailing: Button(action: {
                // refresh the news
            }, label: {
                Image(systemName: "arrow.clockwise.circle")
            }))
        }
    }
}

struct NewsSourceCell: View {
    let newsSource: NewsSourceViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(newsSource.name)
                .font(.headline)
            Text(newsSource.description)
        }
    }
}

#Preview {
    NewsSourceListScreen()
}

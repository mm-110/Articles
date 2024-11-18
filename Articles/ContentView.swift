//
//  ContentView.swift
//  Articles
//
//  Created by Massimo Montanaro on 18/11/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var articles: [Article]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(articles) { article in
                    NavigationLink (value: article) {
                        VStack(alignment: .leading) {
                            Text(article.title)
                                .font(.headline)
                            Text(article.createdAt.formatted(date: .long, time: .shortened))
                        }
                    }
                }
                .onDelete(perform: deleteArticles)
            }
            .navigationTitle("Articles")
            .navigationDestination(for: Article.self, destination: EditArticleView.init)
            .toolbar {
                Button("Add Article", action: addArticles)
            }
        }
    }
    
    func addArticles() {
        let art1 = Article(title: "Article 1", summary: "summary summary summary summary summary", content: "contenconasdoijn asdoihua oisaodikjb okjnb sdflkj baosdicub naoskdfjfbn owiuehrfoiaushdfovi uhasodihvbu oaisjxnv boiaushf oi aosijdhb oaisuhdbv oiajsdbv okjb aosidfhvu oaisuhd voiajdbv oiajd bvfs")
        let art2 = Article(title: "Article 2")
        let art3 = Article(title: "Article 3")
        let art4 = Article(title: "Article 4")
        modelContext.insert(art1)
        modelContext.insert(art2)
        modelContext.insert(art3)
        modelContext.insert(art4)
        
        
    }
    
    func deleteArticles(_ indexSet: IndexSet) {
        for index in indexSet {
            let article = articles[index]
            modelContext.delete(article)
        }
    }
}

#Preview {
    
    ContentView()
}

import SwiftUI
import SwiftData

struct EditArticleView: View {
    @Bindable var article: Article
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(article.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .underline()
                    .padding(.vertical, 8)
                
                HStack {
                    Text("By \(article.author)")
                        .font(.subheadline)
                        .italic()
                    
                    Text("|")
                        .font(.subheadline)
                        .padding(.horizontal, 4)
                    
                    Text(article.createdAt, format: .dateTime.year().month().day())
                        .font(.subheadline)
                }
                .padding(.bottom, 10)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.gray)
                        .opacity(0.2)
                    
                    Text(article.summary)
                        .font(.body)
                        .italic()
                        .foregroundColor(.secondary)
                        .padding(10)
                }
                
                HStack {
                    Spacer()
                    Image(article.imagePath)
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 360, height: 200, alignment: .center)
                        .cornerRadius(25)
                        
                    Spacer()
                }
                
                Spacer()
                
                Text(article.content)
                    .font(.body)
                    .padding(.bottom, 16)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .topLeading)
//            .background(Color(UIColor.systemBackground))
        }
        .background(Color(UIColor.secondarySystemBackground))
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Article.self, configurations: config)
        let example = Article(
            title: "A Journey into SwiftUI",
            summary: "An exploration into the world of SwiftUI, Apple's modern framework for building user interfaces.",
            author: "Jane Doe",
            imagePath: "sneaker",
            content: "SwiftUI is a powerful framework that allows developers to build... and more."
        )
        return EditArticleView(article: example)
            .modelContainer(container)
        
    } catch {
        fatalError("Failed to create model container")
    }
}

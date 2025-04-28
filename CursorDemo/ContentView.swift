import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ReviewView()
                .tabItem {
                    Image(systemName: "clock.arrow.circlepath")
                    Text("复习")
                }
            
            WordSelectionView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("选词")
                }
            
            StatisticsView()
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("统计")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("我的")
                }
        }
    }
}

struct ReviewView: View {
    @State private var currentWord: Word? = Word(english: "flip", chinese: "翻转", pronunciation: "flɪp", audioURL: nil, examples: ["Flip the pancake.", "The coin flip landed on heads."])
    
    var body: some View {
        VStack(spacing: 20) {
            if let word = currentWord {
                Text(word.english)
                    .font(.largeTitle)
                    .bold()
                
                Text(word.pronunciation)
                    .font(.title2)
                    .foregroundColor(.gray)
                
                Text("请回忆单词发音和释义")
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .padding(.top, 40)
                
                Text("点击屏幕显示答案")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            } else {
                Text("今日复习完成")
                    .font(.title)
            }
        }
        .padding()
    }
}

struct StatisticsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("统计页面")
            }
            .navigationTitle("统计")
        }
    }
}

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("个人页面")
            }
            .navigationTitle("我的")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
import SwiftUI

struct WordSelectionView: View {
    @State private var wordBooks: [WordList] = [
        WordList(name: "雅思核心词汇", words: [
            Word(english: "abundant", chinese: "丰富的，充足的", pronunciation: "əˈbʌndənt", audioURL: nil, examples: ["The region has abundant natural resources.", "The garden produces abundant flowers in spring."]),
            Word(english: "deteriorate", chinese: "恶化，变质", pronunciation: "dɪˈtɪərɪəreɪt", audioURL: nil, examples: ["The patient's condition began to deteriorate.", "The old building has deteriorated over time."]),
            Word(english: "unanimous", chinese: "一致的，全体同意的", pronunciation: "juːˈnænɪməs", audioURL: nil, examples: ["The decision was unanimous.", "They reached a unanimous agreement."])
        ]),
        WordList(name: "托福核心词汇", words: [
            Word(english: "pragmatic", chinese: "务实的，实用的", pronunciation: "præɡˈmætɪk", audioURL: nil, examples: ["She takes a pragmatic approach to solving problems.", "We need a pragmatic solution to this issue."]),
            Word(english: "scrutinize", chinese: "仔细检查，详细审查", pronunciation: "ˈskruːtənaɪz", audioURL: nil, examples: ["The committee will scrutinize all applications.", "Scientists scrutinize the data for any anomalies."]),
            Word(english: "versatile", chinese: "多才多艺的，用途广泛的", pronunciation: "ˈvɜːsətaɪl", audioURL: nil, examples: ["She is a versatile actress.", "This is a versatile tool that can be used for many purposes."])
        ])
    ]
    
    var body: some View {
        NavigationView {
            List(wordBooks) { wordBook in
                NavigationLink(destination: WordListDetailView(wordList: wordBook)) {
                    VStack(alignment: .leading) {
                        Text(wordBook.name)
                            .font(.headline)
                        Text("\(wordBook.words.count) 个单词")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("选择词书")
        }
    }
}

struct WordListDetailView: View {
    let wordList: WordList
    
    var body: some View {
        List(wordList.words) { word in
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(word.english)
                        .font(.headline)
                    Text(word.pronunciation)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Text(word.chinese)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                if !word.examples.isEmpty {
                    DisclosureGroup("例句") {
                        VStack(alignment: .leading, spacing: 4) {
                            ForEach(word.examples, id: \.self) { example in
                                Text(example)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .padding(.vertical, 2)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .padding(.vertical, 4)
        }
        .navigationTitle(wordList.name)
    }
}

struct WordSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        WordSelectionView()
    }
} 
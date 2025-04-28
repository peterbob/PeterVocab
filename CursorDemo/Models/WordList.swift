import Foundation

struct WordList: Identifiable, Hashable {
    let id: UUID
    let name: String
    var words: [Word]
    
    init(id: UUID = UUID(), name: String, words: [Word] = []) {
        self.id = id
        self.name = name
        self.words = words
    }
    
    static func == (lhs: WordList, rhs: WordList) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
} 
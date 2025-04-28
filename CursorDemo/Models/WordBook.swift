import Foundation

struct WordBook: Identifiable, Hashable {
    let id: UUID
    let name: String
    let wordLists: [WordList]
    let description: String
    
    init(id: UUID = UUID(), name: String, wordLists: [WordList], description: String = "") {
        self.id = id
        self.name = name
        self.wordLists = wordLists
        self.description = description
    }
    
    static func == (lhs: WordBook, rhs: WordBook) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
} 
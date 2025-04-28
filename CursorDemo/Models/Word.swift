import Foundation

struct Word: Identifiable, Hashable {
    let id = UUID()
    let english: String
    let chinese: String
    let pronunciation: String
    let audioURL: String?
    let examples: [String]
    var isLearned: Bool = false
    var lastReviewDate: Date?
    
    static func == (lhs: Word, rhs: Word) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
} 
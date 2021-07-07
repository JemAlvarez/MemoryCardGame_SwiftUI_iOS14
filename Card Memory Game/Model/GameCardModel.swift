//

import Foundation

struct GameCardModel: Identifiable {
    let id = UUID()
    var image: String
    var flipped: Bool
    var correct: Bool
}

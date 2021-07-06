//

import Foundation

class GameController: ObservableObject {
    // variables
    // user defaults variblae for best time
    @Published var moves = 0
    @Published var difficulty: Int
    @Published var lives: Int
    @Published var timer: Int
    @Published var cards: [GameCardModel]
    @Published var win: Bool?
    
    // init
    init(difficulty: Int) {
        self.difficulty = difficulty
        
        var randomNumbers: [Int] = []
        var cardsArray: [GameCardModel] = []
        
        if difficulty == 1 {
            // lives
            self.lives = 20
            // time
            self.timer = 180
            // cards
            for _ in 0..<6 {
                var newNumber = Int(arc4random_uniform(78))
                
                while randomNumbers.contains(newNumber) {
                    newNumber = Int(arc4random_uniform(78))
                }
                
                randomNumbers.append(newNumber)
                
                let newCard = GameCardModel(image: "\(newNumber)", flipped: false)
                cardsArray.append(newCard)
            }
            
            let copyArray = cardsArray
            cardsArray += copyArray
            cardsArray.shuffle()
            self.cards = cardsArray
        } else if difficulty == 2 {
            // lives
            self.lives = 15
            // time
            self.timer = 120
            // cards
            for _ in 0..<10 {
                var newNumber = Int(arc4random_uniform(78))
                
                while randomNumbers.contains(newNumber) {
                    newNumber = Int(arc4random_uniform(78))
                }
                
                randomNumbers.append(newNumber)
                
                let newCard = GameCardModel(image: "\(newNumber)", flipped: false)
                cardsArray.append(newCard)
            }
            
            let copyArray = cardsArray
            cardsArray += copyArray
            cardsArray.shuffle()
            self.cards = cardsArray
        } else if difficulty == 3 {
            // lives
            self.lives = 10
            // time
            self.timer = 60
            // cards
            for _ in 0..<14 {
                var newNumber = Int(arc4random_uniform(78))
                
                while randomNumbers.contains(newNumber) {
                    newNumber = Int(arc4random_uniform(78))
                }
                
                randomNumbers.append(newNumber)
                
                let newCard = GameCardModel(image: "\(newNumber)", flipped: false)
                cardsArray.append(newCard)
            }
            
            let copyArray = cardsArray
            cardsArray += copyArray
            cardsArray.shuffle()
            self.cards = cardsArray
        } else {
            lives = 0
            timer = 0
            cards = []
        }
    }
    
    // methods
    // check if two cards match
    func checkCardMathc(card1: GameCardModel, card2: GameCardModel) -> Bool {
        if card1.image == card2.image {
            return true
        }
        
        return false
    }
    // game over
    func gameOver() {
        var allCardsMatch = true
        
        for card in cards {
            if card.flipped == false {
                allCardsMatch = false
            }
        }
        
        if allCardsMatch {
            win = true
        } else if lives == 0 {
            win = false
        } else if timer == 0 {
            win = false
        }
    }
    // set userdefaults best time
}

//

import SwiftUI

struct GameView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var audioController: AudioController
    @ObservedObject var gameController: GameController
    
    let columns = [GridItem(), GridItem(), GridItem(), GridItem()]
    @State var card1: GameCardModel?
    @State var card2: GameCardModel?
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color("black").edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    Button(action: {
                        audioController.playUISFX(sound: "cursor_style_1", type: "wav")
                        audioController.playBackgroundMusic(sound: "bg", type: "wav")
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color("greenLight"))
                            .font(.system(size: 25))
                    }
                }
                .padding(.bottom)
                
                HStack {
                    Label("Best Time:", systemImage: "hourglass")
                    Text("00:21 s")
                    Spacer()
                    Text("Difficulty:")
                    Image(systemName: "exclamationmark\(gameController.difficulty == 1 ? "" : ".\(gameController.difficulty)")")
                }
                
                Divider()
                    .background(Color("greenLight"))
                
                HStack {
                    Text("Lives:")
                    LazyHGrid (rows: [GridItem(), GridItem()],spacing: 0) {
                        if gameController.difficulty == 1 {
                            ForEach(0..<20) { i in
                                Image(systemName: "heart\(i < gameController.lives ? ".fill" : "")")
                            }
                        } else if gameController.difficulty == 2 {
                            ForEach(0..<15) { i in
                                Image(systemName: "heart\(i < gameController.lives ? ".fill" : "")")
                            }
                        } else if gameController.difficulty == 3 {
                            ForEach(0..<10) { i in
                                Image(systemName: "heart\(i < gameController.lives ? ".fill" : "")")
                            }
                        }
                    }
                }
                
                Divider()
                    .background(Color("greenLight"))
                
                HStack {
                    Spacer()
                    
                    Label("Moves:", systemImage: "arrow.counterclockwise")
                    Text("\(gameController.moves)")
                    
                    Spacer()
                    
                    Label("Timer:", systemImage: "clock")
                    Text("\((gameController.timer % 3600) / 60):\((gameController.timer % 3600) % 60) s")
                    
                    Spacer()
                }
                
                Divider()
                    .background(Color("greenLight"))
                
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(0..<gameController.cards.count) { i in
                        GameCardView(card: gameController.cards[i], isFlipped: $gameController.cards[i].flipped)
                            .frame(height: 70)
                            .onTapGesture {
                                if card1 == nil || card2 == nil { // if one card missing selected
                                    withAnimation {
                                        gameController.cards[i].flipped = true // flipp card
                                    }
                                    
                                    if card1 == nil { // if card one not selected
                                        audioController.playUISFX(sound: "cursor_style_1", type: "wav") // play sound
                                        card1 = gameController.cards[i] // select first card
                                    } else if card1 != nil && card2 == nil { // if second card not selected (but first is )
                                        if gameController.cards[i].id.uuidString != card1!.id.uuidString { // if not tapping the same card
                                            audioController.playUISFX(sound: "cursor_style_1", type: "wav") // play sound
                                            card2 = gameController.cards[i] // select second card
                                            gameController.moves += 1 // add one move

                                            if gameController.checkCardMatch(card1: card1!, card2: card2!) { // if card match
                                                for j in 0..<gameController.cards.count {
                                                    if gameController.cards[j].image == card1!.image {
                                                        gameController.cards[j].correct = true
                                                    }
                                                }
                                                // reset and move on
                                                card1 = nil
                                                card2 = nil
                                            } else { // if no match
                                                gameController.lives -= 1
                                                
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) { // wait one second
                                                    for i in 0..<gameController.cards.count { // turn back all cards
                                                        if !gameController.cards[i].correct { // if its not a correct card
                                                            withAnimation {
                                                                gameController.cards[i].flipped = false // flip
                                                            }
                                                        }
                                                    }
                                                    
                                                    // reset cards
                                                    card1 = nil
                                                    card2 = nil
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                    }
                }
                .padding(.top)
                
                Spacer()
            }
            .padding()
            .blur(radius: gameController.win != nil ? 10 : 0)
            
            if gameController.win != nil {
                VStack {
                    Text("GAME OVER, you \(gameController.win! ? "win" : "lose")")
                    
                    Button(action: {
                        audioController.playUISFX(sound: "cursor_style_1", type: "wav")
                        audioController.playBackgroundMusic(sound: "bg", type: "wav")
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Exit")
                    }
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(3)
                    .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(gameController.win! ? Color.green.opacity(0.5) : Color.red.opacity(0.5))
                .edgesIgnoringSafeArea(.all)
            }
        }
        .onReceive(timer) { time in
            if gameController.timer > 0 {
                gameController.gameOver()
                
                if gameController.win != nil {
                    if gameController.win! {
                        timer.upstream.connect().cancel()
                    }
                }
                
                gameController.timer -= 1
            } else if gameController.timer == 0 {
                gameController.win = false
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(gameController: GameController(difficulty: 1))
    }
}

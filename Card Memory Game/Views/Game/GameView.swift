//

import SwiftUI

struct GameView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var audioController: AudioController
    @ObservedObject var gameController: GameController
    
    let columns = [GridItem(), GridItem(), GridItem(), GridItem()]
    @State var card1: GameCardModel?
    @State var card2: GameCardModel?
    
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
                    Image(systemName: "exclamationmark.\(gameController.difficulty == 1 ? "" : "\(gameController.difficulty)")")
                }
                
                Divider()
                    .background(Color("greenLight"))
                
                HStack {
                    Text("Lives:")
                    HStack (spacing: 0) {
                        Image(systemName: "heart.fill")
                        Image(systemName: "heart.fill")
                        Image(systemName: "heart.fill")
                        Image(systemName: "heart.fill")
                        Image(systemName: "heart.fill")
                        Image(systemName: "heart.fill")
                        Image(systemName: "heart.fill")
                        Image(systemName: "heart.fill")
                        Image(systemName: "heart.fill")
                        Image(systemName: "heart.fill")
                    }
                }
                
                Divider()
                    .background(Color("greenLight"))
                
                HStack {
                    Spacer()
                    
                    Label("Moves:", systemImage: "arrow.counterclockwise")
                    Text("0")
                    
                    Spacer()
                    
                    Label("Timer:", systemImage: "clock")
                    Text("00:30 s")
                    
                    Spacer()
                }
                
                Divider()
                    .background(Color("greenLight"))
                
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(0..<gameController.cards.count) { i in
                        GameCardView(card: gameController.cards[i], isFlipped: $gameController.cards[i].flipped)
                            .frame(height: 70)
                            .onTapGesture {
                                if card1 == nil || card2 == nil {
                                    withAnimation {
                                        gameController.cards[i].flipped = true
                                    }
                                    
                                    if card1 == nil {
                                        audioController.playUISFX(sound: "cursor_style_1", type: "wav")
                                        card1 = gameController.cards[i]
                                    } else if card1 != nil && card2 == nil {
                                        if gameController.cards[i].id.uuidString != card1!.id.uuidString {
                                            audioController.playUISFX(sound: "cursor_style_1", type: "wav")
                                            card2 = gameController.cards[i]

                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                for i in 0..<gameController.cards.count {
                                                    withAnimation {
                                                        gameController.cards[i].flipped = false
                                                    }
                                                }
                                                
                                                card1 = nil
                                                card2 = nil
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
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(gameController: GameController(difficulty: 1))
    }
}

//

import SwiftUI

struct GameView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var audioController: AudioController
    
    @State var tempCards = [
        GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false), GameCardModel(image: "01", flipped: false),
    ]
    
    let columns = [GridItem(), GridItem(), GridItem(), GridItem(), GridItem()]
    @State var card1: GameCardModel?
    @State var card2: GameCardModel?
    
    var body: some View {
        ZStack {
            Color("black").edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                HStack {
                    Label("Best Time:", systemImage: "hourglass")
                    Text("00:21 s")
                    Spacer()
                    Button(action: {
                        audioController.playUISFX(sound: "cursor_style_1", type: "wav")
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color("greenLight"))
                            .font(.system(size: 25))
                    }
                }
                
                Divider()
                    .background(Color("greenLight"))
                
                HStack {
                    Text("Difficulty:")
                    Image(systemName: "exclamationmark.3")
                    
                    Spacer()
                    
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
                    ForEach(0..<tempCards.count) { i in
                        GameCardView(card: tempCards[i], isFlipped: $tempCards[i].flipped)
                            .frame(height: 70)
                            .onTapGesture {
                                if card1 == nil || card2 == nil {
                                    withAnimation {
                                        tempCards[i].flipped = true
                                    }
                                    
                                    if card1 == nil {
                                        audioController.playUISFX(sound: "cursor_style_1", type: "wav")
                                        card1 = tempCards[i]
                                    } else if card1 != nil && card2 == nil {
                                        if tempCards[i].id.uuidString != card1!.id.uuidString {
                                            audioController.playUISFX(sound: "cursor_style_1", type: "wav")
                                            card2 = tempCards[i]

                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                for i in 0..<tempCards.count {
                                                    withAnimation {
                                                        tempCards[i].flipped = false
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
        GameView()
    }
}

//

import SwiftUI

struct FloatingButtonView: View {
    @EnvironmentObject var audioController: AudioController
    @State var showingButtons = false
    @State var showingGameSheet = false {
        didSet {
            if showingGameSheet == true {
                withAnimation {
                    showingButtons = false
                }
            }
        }
    }
    
    @State var gameController: GameController?
    
    var body: some View {
        ZStack {
            Image(systemName: "exclamationmark")
                .font(.system(size: 30))
                .frame(width: 70, height: 70)
                .background(Color("greenDark"))
                .clipShape(Circle())
                .offset(x: showingButtons ? -80 : 0)
                .onTapGesture {
                    audioController.playUISFX(sound: "cursor_style_1", type: "wav")
                    audioController.playBackgroundMusic(sound: "game", type: "wav")
                    gameController = GameController(difficulty: 1)
                    showingGameSheet.toggle()
                }
            
            Image(systemName: "exclamationmark.3")
                .font(.system(size: 30))
                .frame(width: 70, height: 70)
                .background(Color("greenDark"))
                .clipShape(Circle())
                .offset(y: showingButtons ? -80 : 0)
                .onTapGesture {
                    audioController.playUISFX(sound: "cursor_style_1", type: "wav")
                    audioController.playBackgroundMusic(sound: "game", type: "wav")
                    gameController = GameController(difficulty: 3)
                    showingGameSheet.toggle()
                }
            
            Image(systemName: "exclamationmark.2")
                .font(.system(size: 30))
                .frame(width: 70, height: 70)
                .background(Color("greenDark"))
                .clipShape(Circle())
                .offset(x: showingButtons ? -80 : 0, y: showingButtons ? -80 : 0)
                .onTapGesture {
                    audioController.playUISFX(sound: "cursor_style_1", type: "wav")
                    audioController.playBackgroundMusic(sound: "game", type: "wav")
                    gameController = GameController(difficulty: 2)
                    showingGameSheet.toggle()
                }
            
            Image(systemName: "play.fill")
                .font(.system(size: 30))
                .frame(width: 70, height: 70)
                .background(Color("black"))
                .clipShape(Circle())
                .onTapGesture {
                    audioController.playUISFX(sound: "cursor_style_1", type: "wav")
                    withAnimation {
                        showingButtons.toggle()
                    }
                }
        }
        .fullScreenCover(isPresented: $showingGameSheet) { GameView(gameController: gameController ?? GameController(difficulty: 1)) }
    }
}

struct FloatingButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButtonView()
    }
}

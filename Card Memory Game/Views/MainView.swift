//

import SwiftUI
import AVFoundation

struct MainView: View {
    @StateObject var tabViewModel = TabViewModel()
    @StateObject var audioController = AudioController()
    
    var body: some View {
        ZStack (alignment: .bottomTrailing) {
            Color("black").edgesIgnoringSafeArea(.bottom)
                .frame(height: 50)
                .position(x: UIScreen.main.bounds.width / 2,y: UIScreen.main.bounds.height - 100)
        
            VStack (spacing: 0) {
                ZStack {
                    AllCardsView()
                    .frame(width: UIScreen.main.bounds.width)
                    
                    AllHistoryView()
                    .frame(width: UIScreen.main.bounds.width)
                    .offset(x: UIScreen.main.bounds.width)
                }
                .offset(x: -(UIScreen.main.bounds.width * CGFloat(tabViewModel.selectedTab)))
                .animation(.easeIn)
                
                TabBarView()
            }
            
            FloatingButtonView()
                .offset(y: -80)
                .padding()
        }
        .onAppear {
            audioController.playBackgroundMusic(sound: "bg", type: "wav")
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            audioController.backgroundPlayer?.pause()
            }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            audioController.backgroundPlayer?.play()
            }
        .environmentObject(tabViewModel)
        .environmentObject(audioController)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

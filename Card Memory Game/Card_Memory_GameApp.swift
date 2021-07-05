//

import SwiftUI

@main
struct Card_Memory_GameApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .background(Color("gray").edgesIgnoringSafeArea(.all))
                .foregroundColor(Color("white"))
        }
    }
}

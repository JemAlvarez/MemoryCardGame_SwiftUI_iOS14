//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.bottom)
                .frame(height: 50)
                .position(x: UIScreen.main.bounds.width / 2,y: UIScreen.main.bounds.height - 100)
            
            VStack {
                Spacer()
                TabBarView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

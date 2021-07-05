//

import SwiftUI

struct MainView: View {
    @StateObject var tabViewModel = TabViewModel()
    
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
        .environmentObject(tabViewModel)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

//

import SwiftUI

struct MainView: View {
    @StateObject var tabViewModel = TabViewModel()
    
    var body: some View {
        ZStack (alignment: .bottomTrailing) {
            Color("black").edgesIgnoringSafeArea(.bottom)
                .frame(height: 50)
                .position(x: UIScreen.main.bounds.width / 2,y: UIScreen.main.bounds.height - 100)
        
            VStack (spacing: 0) {
                ZStack {
                    VStack {
                        Text("1")
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .frame(maxHeight: .infinity)
                    
                    AllHistoryView()
                    .frame(width: UIScreen.main.bounds.width)
                    .offset(x: UIScreen.main.bounds.width)
                    
                    AllCardsView()
                    .frame(width: UIScreen.main.bounds.width)
                    .offset(x: UIScreen.main.bounds.width * 2)
                    
                    VStack {
                        Text("4")
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .frame(maxHeight: .infinity)
                    .offset(x: UIScreen.main.bounds.width * 3)
                }
                .offset(x: -(UIScreen.main.bounds.width * CGFloat(tabViewModel.selectedTab)))
                .animation(.easeIn)
                
                TabBarView()
            }
            
            FloatingButtonView()
                .offset(y: -80)
                .padding()
        }
        .environmentObject(tabViewModel)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

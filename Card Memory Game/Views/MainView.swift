//

import SwiftUI

struct MainView: View {
    @StateObject var tabViewModel = TabViewModel()
    
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.bottom)
                .frame(height: 50)
                .position(x: UIScreen.main.bounds.width / 2,y: UIScreen.main.bounds.height - 100)
        
            VStack (spacing: 0) {
                ZStack {
                    VStack {
                        Text("1")
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .frame(maxHeight: .infinity)
                    
                    VStack {
                        Text("2")
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .frame(maxHeight: .infinity)
                    .offset(x: UIScreen.main.bounds.width)
                    
                    VStack {
                        Text("3")
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .frame(maxHeight: .infinity)
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
                
                FloatingButtonView()
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding()
                
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

//

import SwiftUI

struct AllHistoryView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("gray").edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("History")
                        .font(.largeTitle.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .padding(.leading)
                        
                    ScrollView (showsIndicators: false) {
                        VStack(spacing: 20) {
                            ForEach(0..<20, id: \.self) { _ in
                                HistoryCardView()
                            }
                        }
                    }
                    .padding([.horizontal, .top])
                    .foregroundColor(Color("white"))
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct AllHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        AllHistoryView()
    }
}

//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var tabViewModel: TabViewModel
    
    @ObservedObject var viewModel = TabViewModel()
    @State var positions: [CGFloat] = [0, 0, 0, 0]
    
    var body: some View {
        GeometryReader { bounds in
            ZStack {
                HStack {
                    Spacer()
                    
                    ForEach(0..<viewModel.tabsNames.count, id: \.self) { i in
                        GeometryReader { tab in
                            TabBarIconView(selectedTab: $tabViewModel.selectedTab, tag: i, text: viewModel.tabsNames[i], icon: viewModel.tabsIcons[i])
                                .onAppear {
                                    positions[i] = tab.frame(in: .global).midX
                                }
                        }
                        
                        Spacer()
                    }
                }
                .frame(height: 80)
                .background(Color.blue)
                
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.red)
                    .position(x: positions[tabViewModel.selectedTab], y: bounds.frame(in: .local).midY + 13)
            }
        }
        .frame(height: 80)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

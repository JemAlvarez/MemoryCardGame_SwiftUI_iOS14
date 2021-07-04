//

import SwiftUI

struct TabBarView: View {
    let tabsIcons = ["house", "person", "pin", "car"]
    let tabsNames = ["Home", "Person", "Map", "Car"]
    @State var position: [CGFloat] = [0, 0, 0, 0]
    @State var selectedTab = 0
    
    var body: some View {
        GeometryReader { bounds in
            ZStack {
                HStack {
                    Spacer()
                    
                    ForEach(0..<tabsNames.count, id: \.self) { i in
                        GeometryReader { tab in
                            TabBarIconView(selectedTab: $selectedTab, tag: i, text: tabsNames[i], icon: tabsIcons[i])
                                .onAppear {
                                    position[i] = tab.frame(in: .global).midX
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
                    .position(x: position[selectedTab], y: bounds.frame(in: .local).midY + 13)
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

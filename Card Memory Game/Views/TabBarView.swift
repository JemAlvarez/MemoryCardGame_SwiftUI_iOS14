//

import SwiftUI

struct TabBarView: View {
    @State var position: [CGFloat] = [0, 0, 0, 0]
    @State var selectedTab = 0
    
    var body: some View {
        GeometryReader { bounds in
            ZStack {
                HStack {
                    Spacer()
                    
                    GeometryReader { tab0 in
                        TabBarIconView(selectedTab: $selectedTab, tag: 0, text: "\(tab0.frame(in: .global).midX)")
                            .onAppear {
                                position[0] = tab0.frame(in: .global).midX
                                print(position)
                            }
                    }
                    
                    Spacer()
                    
                    GeometryReader { tab1 in
                        TabBarIconView(selectedTab: $selectedTab, tag: 1, text: "\(tab1.frame(in: .global).midX)")
                            .onAppear {
                                position[1] = tab1.frame(in: .global).midX
                                print(position)
                            }
                    }
                    
                    Spacer()
                    
                    GeometryReader { tab2 in
                        TabBarIconView(selectedTab: $selectedTab, tag: 2, text: "\(tab2.frame(in: .global).midX)")
                            .onAppear {
                                position[2] = tab2.frame(in: .global).midX
                                print(position)
                            }
                    }
                    
                    Spacer()
                    
                    GeometryReader { tab3 in
                        TabBarIconView(selectedTab: $selectedTab, tag: 3, text: "\(tab3.frame(in: .global).midX)")
                            .onAppear {
                                position[3] = tab3.frame(in: .global).midX
                                print(position)
                            }
                    }
                    
                    Spacer()
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

struct TabBarIconView: View {
    @Binding var selectedTab: Int
    let tag: Int
    let text: String
    
    let animationDuration = 0.2
    @State var angle: Double = 0
    
    var body: some View {
        VStack {
            Image(systemName: "house")
                .font(.system(size: 20))
                .rotationEffect(Angle(degrees: angle))
            Text(text)
                .font(.system(size: 12).bold())
                .opacity(selectedTab == tag ? 0 : 1)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .onTapGesture {
            withAnimation {
                selectedTab = tag
            }
        }
        .onChange(of: selectedTab) { newTab in
            if newTab == tag {
                withAnimation (Animation.easeIn(duration: animationDuration)) {
                    angle = 45
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                    withAnimation (Animation.easeIn(duration: animationDuration)) {
                        angle = 0
                    }
                }
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

//

import SwiftUI

struct TabBarIconView: View {
    @Binding var selectedTab: Int
    let tag: Int
    let text: String
    let icon: String
    
    let animationDuration = 0.2
    @State var animating = false
    @State var angle: Double = 0
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.system(size: 20))
                .rotationEffect(Angle(degrees: animating ? angle : 0))
                .offset(y: animating ? -10 : 0)
            Text(text)
                .font(.system(size: 12).bold())
                .opacity(selectedTab == tag ? 0 : 1)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .onTapGesture {
            withAnimation {
                if selectedTab > tag {
                    angle = -45
                } else {
                    angle = 45
                }
                
                selectedTab = tag
            }
        }
        .onChange(of: selectedTab) { newTab in
            if newTab == tag {
                withAnimation (Animation.easeIn(duration: animationDuration)) {
                    animating = true
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                    withAnimation (Animation.easeIn(duration: animationDuration)) {
                        animating = false
                    }
                }
            }
        }
    }
}

struct TabBarIconView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarIconView(selectedTab: .constant(0), tag: 0, text: "home", icon: "home")
    }
}

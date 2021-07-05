//

import SwiftUI

struct FloatingButtonView: View {
    @State var showing = false
    
    var body: some View {
        ZStack {
            Image(systemName: "play.fill")
                .font(.title)
                .padding(20)
                .background(Color.yellow)
                .clipShape(Circle())
                .offset(x: showing ? -80 : 0)
            
            Image(systemName: "play.fill")
                .font(.title)
                .padding(20)
                .background(Color.green)
                .clipShape(Circle())
                .offset(y: showing ? -80 : 0)
            
            Image(systemName: "play.fill")
                .font(.title)
                .padding(20)
                .background(Color.blue)
                .clipShape(Circle())
                .offset(x: showing ? -80 : 0, y: showing ? -80 : 0)
            
            Image(systemName: "play.fill")
                .font(.title)
                .padding(20)
                .background(Color.red)
                .clipShape(Circle())
                .onTapGesture {
                    withAnimation {
                        showing.toggle()
                    }
                }
        }
    }
}

struct FloatingButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButtonView()
    }
}

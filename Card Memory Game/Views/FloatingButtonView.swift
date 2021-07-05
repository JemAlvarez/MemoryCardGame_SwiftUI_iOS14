//

import SwiftUI

struct FloatingButtonView: View {
    @State var showing = false
    
    var body: some View {
        ZStack {
            Image(systemName: "exclamationmark")
                .font(.title)
                .frame(width: 70, height: 70)
                .background(Color("greenDark"))
                .clipShape(Circle())
                .offset(x: showing ? -80 : 0)
            
            Image(systemName: "exclamationmark.3")
                .font(.title)
                .frame(width: 70, height: 70)
                .background(Color("greenDark"))
                .clipShape(Circle())
                .offset(y: showing ? -80 : 0)
            
            Image(systemName: "exclamationmark.2")
                .font(.title)
                .frame(width: 70, height: 70)
                .background(Color("greenDark"))
                .clipShape(Circle())
                .offset(x: showing ? -80 : 0, y: showing ? -80 : 0)
            
            Image(systemName: "play.fill")
                .font(.title)
                .frame(width: 70, height: 70)
                .background(Color("black"))
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

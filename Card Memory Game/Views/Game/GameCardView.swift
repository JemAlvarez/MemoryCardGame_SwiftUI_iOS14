//

import SwiftUI

struct GameCardView: View {
    let image: String
    let animationDuration = 0.5
    @State var flipped = false
    @State var showingFront = false
    
    var body: some View {
        VStack {
            if flipped { // front
                if showingFront {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .rotation3DEffect(
                            Angle(degrees: -180),
                            axis: (x: 0.0, y: 1.0, z: 0.0)
                        )
                }
            } else { // back
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(flipped ? Color("greenLight") : Color("gray"))
        .cornerRadius(20)
        .padding(30)
        .background(flipped ? Color.black.opacity(0) : Color("greenDark"))
        .cornerRadius(20)
        .rotation3DEffect(
            Angle(degrees: flipped ? 180 : 0),
            axis: (x: 0.0, y: 1.0, z: 0.0)
        )
        .onTapGesture {
            withAnimation(.easeIn(duration: animationDuration)) {
                flipped.toggle()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration / 2) {
                withAnimation {
                    showingFront.toggle()
                }
            }
        }
    }
}

struct GameCardView_Previews: PreviewProvider {
    static var previews: some View {
        GameCardView(image: "01")
    }
}

//

import SwiftUI

struct GameCardView: View {
    @State var card: GameCardModel
    @Binding var isFlipped: Bool
    
    var body: some View {
        VStack {
            if isFlipped { // front
                Image(card.image)
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .rotation3DEffect(
                        Angle(degrees: -180),
                        axis: (x: 0.0, y: 1.0, z: 0.0)
                    )
            } else { // back
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(isFlipped ? Color("greenLight") : Color("gray"))
        .cornerRadius(20)
        .rotation3DEffect(
            Angle(degrees: isFlipped ? 180 : 0),
            axis: (x: 0.0, y: 1.0, z: 0.0)
        )
        .shadow(color: Color("greenDark"), radius: 3, x: 1, y: 1)
    }
}

struct GameCardView_Previews: PreviewProvider {
    static var previews: some View {
        GameCardView(card: GameCardModel(image: "01", flipped: false), isFlipped: .constant(false))
    }
}

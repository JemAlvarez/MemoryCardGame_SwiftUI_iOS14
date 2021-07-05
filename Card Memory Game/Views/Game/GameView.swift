//

import SwiftUI

struct GameView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Text("Game")
            .onTapGesture {
                presentationMode.wrappedValue.dismiss()
            }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

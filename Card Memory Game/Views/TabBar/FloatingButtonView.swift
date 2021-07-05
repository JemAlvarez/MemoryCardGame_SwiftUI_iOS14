//

import SwiftUI

struct FloatingButtonView: View {
    @State var showingButtons = false
    @State var showingGameSheet = false {
        didSet {
            if showingGameSheet == true {
                withAnimation {
                    showingButtons = false
                }
            }
        }
    }
    
    var body: some View {
        ZStack {
            Image(systemName: "exclamationmark")
                .font(.system(size: 30))
                .frame(width: 70, height: 70)
                .background(Color("greenDark"))
                .clipShape(Circle())
                .offset(x: showingButtons ? -80 : 0)
                .onTapGesture {
                    showingGameSheet.toggle()
                }
            
            Image(systemName: "exclamationmark.3")
                .font(.system(size: 30))
                .frame(width: 70, height: 70)
                .background(Color("greenDark"))
                .clipShape(Circle())
                .offset(y: showingButtons ? -80 : 0)
                .onTapGesture {
                    showingGameSheet.toggle()
                }
            
            Image(systemName: "exclamationmark.2")
                .font(.system(size: 30))
                .frame(width: 70, height: 70)
                .background(Color("greenDark"))
                .clipShape(Circle())
                .offset(x: showingButtons ? -80 : 0, y: showingButtons ? -80 : 0)
                .onTapGesture {
                    showingGameSheet.toggle()
                }
            
            Image(systemName: "play.fill")
                .font(.system(size: 30))
                .frame(width: 70, height: 70)
                .background(Color("black"))
                .clipShape(Circle())
                .onTapGesture {
                    withAnimation {
                        showingButtons.toggle()
                    }
                }
        }
        .fullScreenCover(isPresented: $showingGameSheet) { GameView() }
    }
}

struct FloatingButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButtonView()
    }
}

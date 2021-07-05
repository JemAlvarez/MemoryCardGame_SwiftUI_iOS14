//

import SwiftUI

struct AllCardsView: View {
    let images = Constants.imagesNames
    let columns = [GridItem(), GridItem()]
    
    var body: some View {
        VStack {
            Text("All Cards")
                .font(.largeTitle.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.leading)
            
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(0..<images.count, id: \.self) {i in
                        Image(images[i])
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("greenLight"))
                            .cornerRadius(20)
                            .padding(5)
                            .shadow(color: Color("greenDark"), radius: 5, x: 5, y: 5)
                    }
                }
                .padding([.horizontal, .bottom])
            }
        }
        .background(Color("gray"))
    }
}

struct AllCardsView_Previews: PreviewProvider {
    static var previews: some View {
        AllCardsView()
    }
}

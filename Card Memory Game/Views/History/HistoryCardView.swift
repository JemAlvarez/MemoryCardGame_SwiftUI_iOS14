//

import SwiftUI

struct HistoryCardView: View {
    var body: some View {
        VStack {
            // date
            HStack {
                Label("Date:", systemImage: "calendar")
                Text("July 4, 2021 - 10:35 PM")
                    .font(.system(size: 14))
                
                Spacer()
                
                Image(systemName: "exclamationmark.3")
            }
            
            Divider()
                .background(Color("greenDark"))
            
            HStack {
                Label("Time:", systemImage: "clock")
                Text("00:53 s")
                Spacer()
            }
            
            HStack {
                Label("Lives:", systemImage: "heart.fill")
                HStack {
                    Image(systemName: "heart.fill")
                    Image(systemName: "heart.fill")
                    Image(systemName: "heart")
                }
                Spacer()
            }
            
            HStack {
                Label("Moves:", systemImage: "arrow.counterclockwise")
                Text("8")
                Spacer()
            }
        }
        .padding()
        .background(Color("greenLight"))
        .cornerRadius(20)
        .foregroundColor(Color("gray"))
    }
}

struct HistoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryCardView()
    }
}

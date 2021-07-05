//

import SwiftUI

struct HistoryCardView: View {
    @State var history: HistoryModel
    
    var body: some View {
        VStack {
            // date
            HStack {
                Label("Date:", systemImage: "calendar")
                Text(history.date.formatDate(date: history.date, stringFormat: "MMMM d, yyyy - h:mm a"))
                    .font(.system(size: 14))
                
                Spacer()
                
                Image(systemName: "exclamationmark.\(history.difficulty)")
            }
            
            Divider()
                .background(Color("greenDark"))
            
            HStack {
                Label("Time:", systemImage: "clock")
                Text("\((history.time % 3600) / 60):\((history.time % 3600) % 60)")
                Spacer()
            }
            
            HStack {
                Label("Lives:", systemImage: "heart.fill")
                HStack (spacing: 0) {
                    ForEach(0..<10) { i in
                        if i < history.lives {
                            Image(systemName: "heart.fill")
                        } else {
                            Image(systemName: "heart")
                        }
                    }
                }
                .foregroundColor(Color("greenDark"))
                Spacer()
            }
            
            HStack {
                Label("Moves:", systemImage: "arrow.counterclockwise")
                Text("\(history.moves)")
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
        HistoryCardView(history: HistoryModel(date: Date(), difficulty: 3, time: 30, lives: 4, moves: 17))
    }
}

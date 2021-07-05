//

import SwiftUI

class TabViewModel: ObservableObject {
    let tabsIcons = ["house", "clock.arrow.circlepath", "photo.on.rectangle.angled", "gearshape"]
    let tabsNames = ["Home", "History", "Cards", "Settings"]
    
    @Published var selectedTab = 0
}

//

import SwiftUI

class TabViewModel: ObservableObject {
    let tabsIcons = ["photo.on.rectangle.angled", "clock.arrow.circlepath"]
    let tabsNames = ["Cards", "History"]
    
    @Published var selectedTab = 0
}

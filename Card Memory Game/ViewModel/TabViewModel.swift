//

import SwiftUI

class TabViewModel: ObservableObject {
    let tabsIcons = ["house", "person", "pin", "car"]
    let tabsNames = ["Home", "Person", "Map", "Car"]
    
    @Published var selectedTab = 0
}

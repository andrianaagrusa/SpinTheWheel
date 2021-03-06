//
//  WheelStore.swift
//  SpinTheWheel
//
//  Created by Andriana Agrusa on 5/5/22.
//

import Foundation
import SwiftUI
import Combine

// class that contains all of the wheels in one object
class WheelStore : ObservableObject {
    @Published var wheels: [Wheel]
    
    init (wheels: [Wheel] = []) {
        self.wheels = wheels
    }
}


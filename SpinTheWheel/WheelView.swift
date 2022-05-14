//
//  WheelView.swift
//  SpinTheWheel
//
//  Created by Andriana Agrusa on 5/4/22.
//

// The screen with the Wheel on it

import SwiftUI
import FortuneWheel
import Foundation.NSString

struct WheelView: View {
    
    let selectedWheel: Wheel
    @State var displayAlert = false
    @State var selectIndex = 0

    var body: some View {
        
        VStack {
            Text(selectedWheel.name)
                .font(.title)
                .fontWeight(.bold)
                .lineLimit(7)
                .padding(.bottom, 100.0)
                .frame(width: 400.0, height: 100.0)
            ZStack {
                FortuneWheel(titles: selectedWheel.players.components(separatedBy: ", "), size: 320, onSpinEnd: { i in
                        selectIndex  = i
                        displayAlert = true
                    // your action here - based on index
                })
            }
        }.padding(.bottom, 100.0)
    }
}
extension Color {
    static var darkPurple = Color(red: 128, green: 0, blue: 128)
}

struct WheelView_Previews: PreviewProvider {
    static var previews: some View {
        WheelView(selectedWheel: wheelData[0])
    }
}

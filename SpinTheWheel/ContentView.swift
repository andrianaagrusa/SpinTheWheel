//
//  ContentView.swift
//  SpinTheWheel
//
//  Created by Andriana Agrusa on 5/3/22.
//

import SwiftUI
import FortuneWheel
import CoreGraphics

struct ContentView: View {
    @StateObject var wheelStore : WheelStore = WheelStore(wheels: wheelData)
    @State var spinCount = 0
    
    var body: some View {
        TabView {
            VStack {
                Text("Welcome to Spin the Wheel!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.pink)
                Text("Decision making can be difficult. Thankfully, Spin the Wheel makes it easy for you to make quick decisions without the pressure!")
                    .multilineTextAlignment(.leading)
                    .padding()
                Text("Disclaimer: This app should be used to make minuscule, every-day decisions. Spin The Wheel is not recommended for making life changing or dangerous decisions.")
                    .font(.caption)
                    .fontWeight(.thin)
                    .multilineTextAlignment(.leading)
                    .padding()
            }.tabItem {
                Text("Info")
                Image(systemName: "info")
            }
            
            
            NavigationView {
                List {
                    ForEach (wheelStore.wheels) { wheel in
                        ListCell(wheel: wheel)
                    }
                    .onDelete(perform: deleteItems)
                    .onMove(perform: moveItems)
                }
                .navigationBarTitle(Text("Choose a Wheel"))
                .navigationBarItems(leading: NavigationLink(destination: AddNewWheel(wheelStore: self.wheelStore)) {
                    Text("Add")
                        .foregroundColor(.blue)
                }, trailing: EditButton())
            }.tabItem {
                Text("Wheels")
                Image(systemName: "pencil.and.outline")
            }
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
     
    
    //end body view
    
    func deleteItems(at offsets: IndexSet) {
        wheelStore.wheels.remove(atOffsets: offsets)
    }
    
    func moveItems(from source: IndexSet, to destination: Int) {
        wheelStore.wheels.move(fromOffsets: source, toOffset: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListCell: View {
    var wheel: Wheel; var body: some View {
        NavigationLink(destination: WheelView(selectedWheel: wheel)) {
                Text(wheel.name)
        }
    }
}



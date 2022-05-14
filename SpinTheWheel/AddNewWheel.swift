//
//  AddNewWheel.swift
//  SpinTheWheel
//
//  Created by Andriana Agrusa on 5/5/22.
//

import SwiftUI

// View that allows user to add a new wheel
struct AddNewWheel: View {
    @StateObject var wheelStore : WheelStore
    @State private var name: String = ""
    @State private var players: String = ""
    
    var body: some View {
        // Where the user inputs the data
        Form {
            Section(header: Text("Create New Wheel")) {
                DataInput(title: "Name for this Wheel: ", userInput: $name)
                    .padding()
                DataInput(title: "Input wheel entries, separated by a comma: ", userInput: $players)
                    .padding(.bottom)
                    .frame(height: 300.0)
                }
            Button(action: addNewWheel) {
                Text("Create")
            }
        }
    }
    
    // function to add the new wheel to the store of wheels
    func addNewWheel() {
        let newWheel = Wheel(id: UUID().uuidString,
                             name: name, players: players)
        wheelStore.wheels.append(newWheel)
    }
}

struct AddNewWheel_Previews: PreviewProvider {
    static var previews: some View {
        AddNewWheel(wheelStore: WheelStore(wheels: wheelData))
    }
}

// struct for the process of user input
struct DataInput: View {
    var title: String
    @Binding var userInput: String
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField("Type here...", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}


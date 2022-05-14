//
//  WheelData.swift
//  SpinTheWheel
//
//  Created by Andriana Agrusa on 5/5/22.
//

// Contains the data for  the Wheel, gets info from Json file

import Foundation
import UIKit
import SwiftUI

// Loads Wheel information from the json file
var wheelData: [Wheel] = loadJson("wheelData.json")

func loadJson<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename,
                                     withExtension: nil)
    else {
        fatalError("\(filename) not found.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename): \(error)")
    }
    
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename): \(error)")
    }
}

//
//  main.swift
//  Coconut
//
//  Created by Dami on 07/10/2016.
//
//

import Foundation
import SWXMLHash

let xmlToParse = URL(fileURLWithPath: "Files/Converter/Nibs/MainMenu.xib")
let data = try? Data(contentsOf: xmlToParse)
let xml = SWXMLHash.parse(data!)


do {
    let node = try xml.byKey("document").byKey("dependencies")
    print("\(node.description)")
} catch {
    print("Error : \(error)")
}

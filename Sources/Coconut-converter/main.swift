//
//  main.swift
//  Coconut
//
//  Created by Dami on 07/10/2016.
//
//

import Foundation
import AEXML

let xmlToParse = URL(fileURLWithPath: "Files/Converter/Nibs/MainMenu.xib")
let data = try? Data(contentsOf: xmlToParse)

let xmlDoc = try AEXMLDocument(xml: data!)

// prints the same XML structure as original
print(xmlDoc.xml)

// prints cats, dogs
for child in xmlDoc.root.children {
    print(child.name)
}

//
//  main.swift
//  Coconut
//
//  Created by Dami on 07/10/2016.
//
//

import Foundation
import LibXml2Swift

let file = "Files/Converter/Nibs/MainMenu.xib"

do {
    
    // XML Url
    let url = URL(fileURLWithPath: file)
    
    // Open documents
    let document = try XmlDomReader.read(atPath: url)
    
    // Recherche de l'eleemnt racine
    let rootElement = try document.rootElement()
    
} catch {
    print("\(error)")
}

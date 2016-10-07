//
//  main.swift
//  Coconut
//
//  Created by Dami on 07/10/2016.
//
//

import Foundation

class Delegate : NSObject, XMLParserDelegate {
    
}


let parser = XMLParser(contentsOf: URL(fileURLWithPath: "Files/Converter/Nibs/MainMenu.xib"))
if let parser = parser {
    parser.parse()
}

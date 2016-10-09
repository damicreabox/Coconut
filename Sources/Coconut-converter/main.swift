//
//  main.swift
//  Coconut
//
//  Created by Dami on 07/10/2016.
//
//

import Foundation

let file = "Files/Converter/Nibs/MainMenu.xib"

guard FileManager.default.fileExists(atPath: file) else {
  print("File doesn't exists")
  exit(1)
}

let content = try String(contentsOfFile: file, encoding: String.Encoding.utf8)

let url = URL(fileURLWithPath: file)

guard let parser = XMLParser(contentsOf: url) else {
  print("Parser")
  exit(3)
}

parser.delegate = NibParserDelegate()
parser.parse()

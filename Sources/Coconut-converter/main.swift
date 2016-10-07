//
//  main.swift
//  Coconut
//
//  Created by Dami on 07/10/2016.
//
//

import Foundation

class Delegate : NSObject, XMLParserDelegate {
    
    
    public func parserDidStartDocument(_ parser: XMLParser) {
        print("Begin parsing")
    }
    
    
    public func parserDidEndDocument(_ parser: XMLParser) {
        print("End parsing")
        
    }

    
    
    public func parser(_ parser: XMLParser, foundNotationDeclarationWithName name: String, publicID: String?, systemID: String?) {
        print("Notation name \(name)")
    }

    
    
    public func parser(_ parser: XMLParser, foundUnparsedEntityDeclarationWithName name: String, publicID: String?, systemID: String?, notationName: String?) {
        print("Unparsed name \(name)")
    }

    
    
    public func parser(_ parser: XMLParser, foundAttributeDeclarationWithName attributeName: String, forElement elementName: String, type: String?, defaultValue: String?) {
        print("Attribute name \(attributeName)")
    }

    
    
    public func parser(_ parser: XMLParser, foundElementDeclarationWithName elementName: String, model: String) {
        print("Element name \(elementName)")
    }

    
    
    public func parser(_ parser: XMLParser, foundInternalEntityDeclarationWithName name: String, value: String?) {
        print("Internal entity name \(name)")
    }

    
    
    public func parser(_ parser: XMLParser, foundExternalEntityDeclarationWithName name: String, publicID: String?, systemID: String?) {
        print("External entity name \(name)")
    }

    
    
    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        print("Element start name \(elementName)")
    }

    
    
    public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        print("Element end name \(elementName)")
    }

    
    
    public func parser(_ parser: XMLParser, didStartMappingPrefix prefix: String, toURI namespaceURI: String) {
        print("Mapping prefix start name \(prefix)")
    }

    
    
    public func parser(_ parser: XMLParser, didEndMappingPrefix prefix: String) {
        print("Mapping prefix end name \(prefix)")
        
    }

    
    
    public func parser(_ parser: XMLParser, foundCharacters string: String) {
        print("\(string)")
    }

    
    
    public func parser(_ parser: XMLParser, foundIgnorableWhitespace whitespaceString: String) {
        print("White spaces")
        
    }

    
    
    public func parser(_ parser: XMLParser, foundProcessingInstructionWithTarget target: String, data: String?) {
        print("Processing \(data)")
    }

    
    
    public func parser(_ parser: XMLParser, foundComment comment: String) {
        print("Comments \(comment)")
    }

    
    
    public func parser(_ parser: XMLParser, foundCDATA CDATABlock: Data) {
        print("CData")
    }

    
    
    public func parser(_ parser: XMLParser, resolveExternalEntityName name: String, systemID: String?) -> Data?  {
        return nil
    }

    
    
    public func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("Error \(parseError)")
    }

    
    
    public func parser(_ parser: XMLParser, validationErrorOccurred validationError: Error) {
        print("Validation error \(validationError)")
    }

}


let parser = XMLParser(contentsOf: URL(fileURLWithPath: "Files/Converter/Nibs/MainMenu.xib"))
if let parser = parser {
    parser.shouldProcessNamespaces = false
    parser.shouldReportNamespacePrefixes = false
    parser.shouldResolveExternalEntities = false
    parser.delegate = Delegate()
    parser.parse()
}

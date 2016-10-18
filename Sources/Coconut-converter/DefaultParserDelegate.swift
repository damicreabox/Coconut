import Foundation

#if os(macOS) || os(iOS) || os(watchOS) || os(tvOS)
    
    public class DefaultParserDelegate : NSObject, XMLParserDelegate {
        
    }
    
#else

    public class DefaultParserDelegate : NSObject, XMLParserDelegate {
        
        // --- Document ---
        
        public func parserDidStartDocument(_ parser: Foundation.XMLParser) {
            
        }
        
        public func parserDidEndDocument(_ parser: Foundation.XMLParser) {
            
        }
        
        // --- Notation ---
        
        public func parser(_ parser: Foundation.XMLParser, foundNotationDeclarationWithName name: String, publicID: String?, systemID: String?) {
            
        }
        
        // --- Entities ---
        
        public func parser(_ parser: Foundation.XMLParser, foundUnparsedEntityDeclarationWithName name: String, publicID: String?, systemID: String?, notationName: String?) {
            
        }
        
        public func parser(_ parser: Foundation.XMLParser, foundInternalEntityDeclarationWithName name: String, value: String?) {
            
        }
        
        public func parser(_ parser: Foundation.XMLParser, foundExternalEntityDeclarationWithName name: String, publicID: String?, systemID: String?) {
            
        }
        public func parser(_ parser: Foundation.XMLParser, resolveExternalEntityName name: String, systemID: String?) -> Foundation.Data? {
            return nil
        }
        
        // --- Attributes ---
        public func parser(_ parser: Foundation.XMLParser, foundAttributeDeclarationWithName attributeName: String, forElement elementName: String, type: String?, defaultValue: String?) {
            
        }
        
        // --- Elements ---
        
        public func parser(_ parser: Foundation.XMLParser, foundElementDeclarationWithName elementName: String, model: String) {
            
        }
        
        public func parser(_ parser: Foundation.XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
            
        }
        
        public func parser(_ parser: Foundation.XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
            
        }
        
        // --- Mapping ?
        
        public func parser(_ parser: Foundation.XMLParser, didStartMappingPrefix prefix: String, toURI namespaceURI: String) {
            
        }
        
        public func parser(_ parser: Foundation.XMLParser, didEndMappingPrefix prefix: String) {
            
        }
        
        // --- Comments ---
        
        public func parser(_ parser: Foundation.XMLParser, foundComment comment: String) {
            
        }
        
        // --- Characters ---
        
        public func parser(_ parser: Foundation.XMLParser, foundCharacters string: String) {
            
        }
        
        // --- White spaces ---
        
        public func parser(_ parser: Foundation.XMLParser, foundIgnorableWhitespace whitespaceString: String) {
            
        }
        
        // --- CData ---
        
        public func parser(_ parser: Foundation.XMLParser, foundCDATA CDATABlock: Foundation.Data) {
            
        }
        
        // --- Error ---
        
        public func parser(_ parser: Foundation.XMLParser, parseErrorOccurred parseError: Foundation.NSError) {
            
        }
        
        public func parser(_ parser: Foundation.XMLParser, validationErrorOccurred validationError: Foundation.NSError) {
            
        }
        
        // --- Processing ---
        
        public func parser(_ parser: Foundation.XMLParser, foundProcessingInstructionWithTarget target: String, data: String?) {
            
        }
    }


#endif

import Foundation
import Commons

public class NibParserDelegate : DefaultParserDelegate {

  // --- Elements ---

  override public func parser(_ parser: Foundation.XMLParser, foundElementDeclarationWithName elementName: String, model: String) {
    print("<\(elementName) />")
  }

  override public func parser(_ parser: Foundation.XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
    print("<\(elementName)>")
  }

  override public func parser(_ parser: Foundation.XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
    print("</\(elementName)>")
  }
}

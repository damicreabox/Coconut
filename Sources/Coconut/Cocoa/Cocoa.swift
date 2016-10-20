//
//  Cocoa.swift
//  Coconut
//
//  Created by Dami on 06/10/2016.
//
//

import Foundation

typealias NSApplicationDelegate = ApplicationDelegate
typealias NSView = View
typealias NSViewController = ViewController
typealias NSWindow = Window
typealias NSScreen = Screen
typealias NSColor = Color
typealias NSButton = Button
typealias NSControl = Control

typealias NSResponder = Responder
typealias NSAnimatablePropertyContainer = AnimatablePropertyContainer
typealias NSUserInterfaceItemIdentification = UserInterfaceItemIdentification
typealias NSDraggingDestination = DraggingDestination
typealias NSAppearanceCustomization = AppearanceCustomization
typealias NSAccessibilityElementProtocol = AccessibilityElementProtocol
typealias NSAccessibility = Accessibility

// -- Application --

typealias NSApplication = Application
extension NSApplication {
    
    convenience init?(delegate: ApplicationDelegate, andNibName name: String) {
        self.init(delegate: delegate, uiName: name)
    }
}

// -- Nib --

typealias NSNib = UIDefinition
extension NSNib {
    
    convenience init?(nibNamed nibName: String, bundle: Bundle?) {
        self.init(name: nibName, bundle: bundle)
    }
    
    public func instantiate(withOwner owner: Any?, topLevelObjects: UnsafeMutablePointer<NSArray>?) -> Bool {
        var objects : [NSObject]? = nil
        if topLevelObjects != nil  {
            objects = topLevelObjects?.pointee as! [NSObject]?
        }
        return self.instantiate(owner: owner, objects: objects)
    }
}

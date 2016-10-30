//
//  Cocoa.swift
//  Coconut
//
//  Created by Dami on 06/10/2016.
//
//

import Foundation

public typealias NSFontManager = FontManager
public typealias NSApplicationDelegate = ApplicationDelegate
public typealias NSView = View
public typealias NSViewController = ViewController
public typealias NSWindow = Window
public typealias NSScreen = Screen
public typealias NSColor = Color
public typealias NSButton = Button
public typealias NSControl = Control

public typealias NSResponder = Responder
public typealias NSAnimatablePropertyContainer = AnimatablePropertyContainer
public typealias NSUserInterfaceItemIdentification = UserInterfaceItemIdentification
public typealias NSDraggingDestination = DraggingDestination
public typealias NSAppearanceCustomization = AppearanceCustomization
public typealias NSAccessibilityElementProtocol = AccessibilityElementProtocol
public typealias NSAccessibility = Accessibility

// -- Application --

public typealias NSApplication = Application
extension NSApplication {
    
    convenience init?(delegate: ApplicationDelegate, andNibName name: String) {
        self.init(delegate: delegate, uiName: name)
    }
}

// -- Nib --

public typealias NSNib = UIDefinition
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

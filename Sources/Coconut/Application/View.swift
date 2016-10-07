//
//  View.swift
//  Coconut
//
//  Created by Dami on 06/10/2016.
//
//

import Foundation

import CGtk

public class View : Responder, AnimatablePropertyContainer, UserInterfaceItemIdentification, DraggingDestination, AppearanceCustomization, AccessibilityElementProtocol, Accessibility {
    
    internal var widget : UnsafeMutablePointer<GtkWidget>? = nil
    
    public var needsDisplay: Bool = false
    
    // --- Init ---
    
    init() {
    }
    
    // --- Size ---
    
    public var frame : NSRect {
        return NSRect(origin: NSPoint(x: 0, y: 0), size: NSSize(width: 0, height: 0))
    }
    
    public var bounds : NSRect {
        return NSRect(origin: NSPoint(x: 0, y: 0), size: NSSize(width: 0, height: 0))
    }
    
    public func draw(_ dirtyRect: NSRect) {
        
    }
    
    // --- Window ---
    
    public internal(set) var window: Window?
    
    // --- View ---
    
    // -- Super view --
    
    public private(set) var superview: View?
    
    public func removeFromSuperview() {
        
    }
    
    // -- Views --
    
    internal var views: [View] = []
    
    public func addSubview(_ view: View) {
        views.append(view)
    }
    
    public var subviews: [View] {
        get {
            return views
        }
        set {
            self.views = subviews
        }
    }
    
    public func replaceSubview(_ oldView: View,
                               with newView: View){
        for i in 0...views.count {
            let view = views[i]
            if (view === oldView) {
                views[i] = newView
                break
            }
        }
    }
    
    // --- Internal GTK ---
    
    internal func redraw(widget parent: UnsafeMutablePointer<GtkWidget>) -> UnsafeMutablePointer<GtkWidget>? {
        return nil
    }
}

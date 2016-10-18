//
//  View.swift
//  Coconut
//
//  Created by Dami on 06/10/2016.
//
//

import Foundation

import CGtk

/// Define a view
public class View : Responder, AnimatablePropertyContainer, UserInterfaceItemIdentification, DraggingDestination, AppearanceCustomization, AccessibilityElementProtocol, Accessibility {
    
    /// Internal GTK widget
    internal var widget : UnsafeMutablePointer<GtkWidget>? = nil
    
    /// Flag to redraw
    public var needsDisplay: Bool = false
    
    // --- Init ---
    
    init() {
    }
    
    // --- Size ---
    
    // FIXME Implement
    public var frame : NSRect {
        return NSRect(origin: NSPoint(x: 0, y: 0), size: NSSize(width: 0, height: 0))
    }
    
    // FIXME Implement
    public var bounds : NSRect {
        return NSRect(origin: NSPoint(x: 0, y: 0), size: NSSize(width: 0, height: 0))
    }
    
    // FIXME Implement
    public func draw(_ dirtyRect: NSRect) {
        
    }
    
    // --- Window ---
    
    /// Window containing this view
    public internal(set) var window: Window?
    
    // --- View ---
    
    // -- Super view --
    
    /// Parent view
    public private(set) var superview: View?
    
    // FIXME Implement
    public func removeFromSuperview() {
        
    }
    
    // -- Views --
    
    /// Children views
    internal var views: [View] = []
    
    /// Add child
    public func addSubview(_ view: View) {
        views.append(view)
    }
    
    /// Manage chlidrens like an array
    public var subviews: [View] {
        get {
            return views
        }
        set {
            self.views = subviews
        }
    }
    
    /// Replace view by another
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

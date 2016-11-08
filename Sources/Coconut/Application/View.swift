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
    
    public override init() {
        frame = NSRect()
    }
    
    public init(frame: NSRect) {
        self.frame = frame
    }
    
    // --- Size ---
    
    /// View frame
    public let frame : NSRect
    
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
    
    // --- Constraints ---
    
    var constraints: [NSLayoutConstraint] {
        get {
            return [NSLayoutConstraint]()
        }
    }
    
    // --- Internal GTK ---
    
    internal func redraw(widget parent: UnsafeMutablePointer<GtkWidget>) -> UnsafeMutablePointer<GtkWidget>? {
        
        // Test constraints
        let constraints = self.constraints
        if (constraints.isEmpty) {
            
            // Create fixed container
            self.widget = gtk_fixed_new()
            
            // Aprse views
            for view in self.views {
                
                // Redraw
                if let subWidget = view.redraw(widget: self.widget!) {
                    
                    // Covert point
                    let origin = convertPoint(point: view.frame.origin, frame: frame)
                    
                    let fixed = toFixed(widget: self.widget)
                    
                    // Atache element
                    gtk_fixed_put (fixed, subWidget, 0, 0)
                    gtk_fixed_move(fixed, subWidget, Int32(origin.x), Int32(origin.y))
                    
                }
            }
            
        } else {
            /* Here we construct the container that is going pack our buttons */
            self.widget = gtk_grid_new ()
            
            // Parse views
            var index : Int32 = 0
            for view in self.views {
                // Redraw
                if let subWidget = view.redraw(widget: self.widget!) {
                    
                    // Atache element
                    gtk_grid_attach (toGrid(widget: self.widget), subWidget, 1, index, 2, 1)
                    
                }
                
                // Add index
                index = index + 1
            }
        }
        
        
        // Pack the container in the window
        gtk_container_add (toContainer(widget: parent), self.widget)
        
        // Add view
        gtk_container_add(toContainer(widget: widget), self.widget)
        
        return widget

    }
}

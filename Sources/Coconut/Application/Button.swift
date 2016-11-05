//
//  Button.swift
//  Coconut
//
//  Created by Dami on 07/10/2016.
//
//

import Foundation

import CGtk

/// Define a button
public class Button : Control {
 
    /// Button title
    public var title: String
    
    public init(title: String, action: Action = EmptyAction()) {
        self.title = title
        super.init(action: action)
    }
    
    // --- Internal GTK ---
    
    override internal func redraw(widget parent: UnsafeMutablePointer<GtkWidget>) -> UnsafeMutablePointer<GtkWidget>? {
        
        widget = gtk_button_new_with_label (title)
        _ = connect(source: widget!, signal: "clicked", action: &action)
        
        return widget
    }
}

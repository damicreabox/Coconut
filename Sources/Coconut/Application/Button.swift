//
//  Button.swift
//  Coconut
//
//  Created by Dami on 07/10/2016.
//
//

import Foundation

import CGtk

class Button : Control {
 
    public var title: String
    
    init(title: String, action: Action = EmptyAction()) {
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

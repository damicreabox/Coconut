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
    public var title: String {
        willSet {
            gtk_button_set_label(toButton(widget: widget), newValue)
        }
    }
    
    public init(frame: NSRect) {
        self.title = ""
        super.init(frame: frame)
        
        widget = gtk_button_new_with_label (title)
        
        gtk_widget_set_size_request(widget, Int32(frame.width), Int32(frame.height))
        
        _ = connect(source: widget!, signal: "clicked", action: &actionWrapper)
    }
    
    // --- Internal GTK ---
    
    override internal func redraw(widget parent: UnsafeMutablePointer<GtkWidget>) -> UnsafeMutablePointer<GtkWidget>? {
        return widget
    }
}

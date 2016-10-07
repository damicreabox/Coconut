//
//  Window.swift
//  Coconut
//
//  Created by Dami on 06/10/2016.
//
//

import Foundation
import CGtk

public class Window {
    
    var window : UnsafeMutablePointer<GtkWidget>
    
    public init(contentRect frame: NSRect) {
        self.window = gtk_window_new (GTK_WINDOW_TOPLEVEL)
        
        // Convert point from cocoa to gtk
        let origin = gtkScreenPositionFromCocoa(origin: frame.origin)
        
        gtk_window_set_title (toWindow (widget: window), "Hello World")
        gtk_window_set_default_size (toWindow (widget: window), Int32(frame.size.width), Int32(frame.size.height))
        gtk_window_move(toWindow(widget: window), Int32(origin.x), Int32(origin.y))
    }
    
    public func makeKeyAndOrderFront(_ sender: Any?) {
        gtk_widget_show (window)
    }
}

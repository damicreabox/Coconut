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
    
    /// GTK window pointer
    var window : UnsafeMutablePointer<GtkWidget>
    
    public init(contentRect frame: NSRect, title : String = "Untitled") {
        self.window = gtk_window_new (GTK_WINDOW_TOPLEVEL)
        
        // Convert point from cocoa to gtk
        let origin = gtkScreenPositionFromCocoa(origin: frame.origin)
        
        // Set size
        gtk_window_set_default_size (toWindow (widget: window), Int32(frame.size.width), Int32(frame.size.height))
        
        // Set position
        gtk_window_move(toWindow(widget: window), Int32(origin.x), Int32(origin.y))
        
        // Init container
        contentView = ContainerView()
        
        self.title = title
        gtk_window_set_title(toWindow(widget: window), title)
    }
    
    public func makeKeyAndOrderFront(_ sender: Any?) {
        
        // Display view
        _ = contentView?.redraw(widget: self.window)
        
        // Display all windows
        gtk_widget_show_all (window)
    }
    
    // --- Informations ---
    
    public let windowNumber: Int = -1
    
    // --- Configuring ---
    
    public var backgroundColor: Color! = nil
    
    public var contentView: View? = nil
    
    internal var viewController: ViewController? = nil
    
    // --- Sizing ---
    
    public var frame: NSRect {
        get {
            
            var x: Int32 = 0
            var y: Int32 = 0
            gtk_window_get_position(toWindow(widget: window), &x, &y)
            
            var width: Int32 = 0
            var height: Int32 = 0
            gtk_window_get_size(toWindow(widget: window), &width, &height)
            
            return NSRect(origin: NSPoint(x: Int(x), y: Int(y)), size: NSSize(width: Int(width), height: Int(height)))
        }
    }
    
    // --- Titles ---
    
    public var title: String {
        willSet {
            gtk_window_set_title(toWindow(widget: window), title)
        }
    }
    
    // --- Closing ---
    
    public func close() {
        
    }
    
    // --- Screen ---
    
    public var screen: Screen? {
        get {
            return nil
        }
    }
}

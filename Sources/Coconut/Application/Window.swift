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
    
    public init(contentRect frame: NSRect) {
        self.window = gtk_window_new (GTK_WINDOW_TOPLEVEL)
        
        // Convert point from cocoa to gtk
        let origin = gtkScreenPositionFromCocoa(origin: frame.origin)
        
        // Set windo title
        gtk_window_set_title (toWindow (widget: window), "Hello World")
        
        // Set size
        gtk_window_set_default_size (toWindow (widget: window), Int32(frame.size.width), Int32(frame.size.height))
        
        // Set position
        gtk_window_move(toWindow(widget: window), Int32(origin.x), Int32(origin.y))
        
        // Init container
        view = ContainerView()
    }
    
    public func makeKeyAndOrderFront(_ sender: Any?) {
        
        // Display view
        _ = contentView?.redraw(widget: self.window)
        
        /* Now that we are done packing our widgets, we show them all
         * in one go, by calling gtk_widget_show_all() on the window.
         * This call recursively calls gtk_widget_show() on all widgets
         * that are contained in the window, directly or indirectly.
         */
        gtk_widget_show_all (window)
    }
    
    // --- Informations ---
    
    public var windowNumber: Int {
        get {
            return 0
        }
    }
    
    // --- Configuring ---
    
    internal var bgColor: Color! = nil
    
    public var backgroundColor: Color! {
        get {
            return bgColor
        }
        set {
            self.bgColor = backgroundColor
        }
    }
    
    internal var view: View? = nil
    
    public var contentView: View? {
        get {
            return view
        }
        set {
            self.view = contentView
        }
    }
    
    internal var viewController: ViewController? = nil
    
    public var contentViewController: ViewController? {
        get {
            return viewController
        }
        set {
            self.viewController = contentViewController
        }
    }
    
    // --- Sizing ---
    
    public var frame: NSRect {
        get {
            return NSRect(x: 0, y: 0, width: 0, height: 0)
        }
    }
    
    // --- Titles ---
    
    private var windowTitle : String = "Untitled"
    
    public var title: String {
        get {
            return windowTitle
        }
        set {
            self.windowTitle = title
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

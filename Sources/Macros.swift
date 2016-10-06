//
//  Macro.swift
//  Coconut
//
//  Created by Dami on 05/10/2016.
//
//

import Foundation
import CGtk

func gtkScreenPositionFromCocoa(origin: NSPoint) -> NSPoint {
    
    let screen = gdk_screen_get_default()
    let height = gdk_screen_get_height(screen)
    return NSPoint(x: origin.x, y: CGFloat(height - Int32(origin.y)))
}

func toWindow(widget: UnsafeMutablePointer<GtkWidget>?) -> UnsafeMutablePointer<GtkWindow> {
    return unsafeBitCast(widget, to: UnsafeMutablePointer<GtkWindow>.self)
}

func toContainer(widget: UnsafeMutablePointer<GtkWidget>?) -> UnsafeMutablePointer<GtkContainer> {
    return unsafeBitCast(widget, to: UnsafeMutablePointer<GtkContainer>.self)
}

func connectSignal(object: UnsafeMutablePointer<GObject>?, signal: String, callback: @escaping GCallback) {
    g_signal_connect_data (object, signal, callback, nil, nil, G_CONNECT_AFTER)
}

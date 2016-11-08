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

func convertPoint(point: NSPoint, frame: NSRect) -> NSPoint {
    return NSPoint(x: point.x, y: frame.size.height - point.y)
}

func toWidget(pointer: UnsafeMutablePointer<gpointer>?) -> UnsafeMutablePointer<GtkWidget> {
    return unsafeBitCast(pointer, to: UnsafeMutablePointer<GtkWidget>.self)
}

func toWindow(widget: UnsafeMutablePointer<GtkWidget>?) -> UnsafeMutablePointer<GtkWindow> {
    return unsafeBitCast(widget, to: UnsafeMutablePointer<GtkWindow>.self)
}

func toContainer(widget: UnsafeMutablePointer<GtkWidget>?) -> UnsafeMutablePointer<GtkContainer> {
    return unsafeBitCast(widget, to: UnsafeMutablePointer<GtkContainer>.self)
}

func toGrid(widget: UnsafeMutablePointer<GtkWidget>?) -> UnsafeMutablePointer<GtkGrid> {
    return unsafeBitCast(widget, to: UnsafeMutablePointer<GtkGrid>.self)
}
func toFixed(widget: UnsafeMutablePointer<GtkWidget>?) -> UnsafeMutablePointer<GtkFixed> {
    return unsafeBitCast(widget, to: UnsafeMutablePointer<GtkFixed>.self)
}


func toGPointer(widget: UnsafeMutablePointer<GtkWidget>?) -> UnsafeMutablePointer<gpointer?> {
    return unsafeBitCast(widget, to: UnsafeMutablePointer<gpointer?>.self)
}

func toButton(widget: UnsafeMutablePointer<GtkWidget>?) -> UnsafeMutablePointer<GtkButton> {
    return unsafeBitCast(widget, to: UnsafeMutablePointer<GtkButton>.self)
}

func connectSignal(object: UnsafeMutablePointer<GObject>?, signal: String, callback: @escaping GCallback) {
    g_signal_connect_data (object, signal, callback, nil, nil, G_CONNECT_AFTER)
}

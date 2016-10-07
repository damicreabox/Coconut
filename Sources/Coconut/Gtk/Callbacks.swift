//
//  Callbacks.swift
//  Coconut
//
//  Created by Dami on 07/10/2016.
//
//

import Foundation

import CGtk

protocol GtkWrapperLauncher {
    func launch()
}

class GtkWrapper<T> : GtkWrapperLauncher {
    
    private var object: T
    private var callback: (_ object: T)->Void
    
    init(object: T, callback: @escaping (_ object: T)->Void) {
        self.object = object
        self.callback = callback
    }
    
    public func launch() {
    
    }
}

func connect(source: UnsafeMutablePointer<GtkWidget>, signal: String,
             callback: @escaping SGGCallback, destination: UnsafeMutablePointer<gpointer?>?) -> UInt {
    return connect(source: source, signal: signal, callback: callback, destination: destination, flags: G_CONNECT_SWAPPED)
}

func connect<T>(source: UnsafeMutablePointer<GtkWidget>, signal: String,
             object: T, callback: @escaping (_ object: T)->Void,
             flags: GConnectFlags) -> GtkWrapper<T> {
    let wrapper = GtkWrapper<T>(object: object, callback: callback)
    let launcher : SGGCallback = { (source, pointer) in
        let wrapper : GtkWrapperLauncher = unsafeBitCast(pointer, to: GtkWrapperLauncher.self)
        wrapper.launch()
    }
    
    gtk_connect(source, signal, launcher,
                       unsafeBitCast(wrapper, to: UnsafeMutablePointer<gpointer?>.self),
                       flags)
    
    return wrapper
}

func connect(source: UnsafeMutablePointer<GtkWidget>, signal: String,
             callback: @escaping SGGCallback, destination: UnsafeMutablePointer<gpointer?>?,
             flags: GConnectFlags) -> UInt {
    return gtk_connect(source, signal, callback, destination, flags)
}

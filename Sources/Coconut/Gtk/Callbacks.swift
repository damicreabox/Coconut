//
//  Callbacks.swift
//  Coconut
//
//  Created by Dami on 07/10/2016.
//
//

import Foundation

import CGtk

class GtkWrapper<T> : Action {
    
    private var object: T
    private var callback: (_ object: T)->Void
    
    init(object: T, callback: @escaping (_ object: T)->Void) {
        self.object = object
        self.callback = callback
    }
    
    public func perform() {
        callback(object)
    }
}

func connect(source: UnsafeMutablePointer<GtkWidget>, signal: String,
             callback: @escaping SGGCallback, destination: UnsafeMutablePointer<gpointer?>?,
             flags: GConnectFlags) -> UInt {
    return gtk_connect(source, signal, callback, destination)
}

func connect(source: UnsafeMutablePointer<GtkWidget>, signal: String, action: UnsafeMutablePointer<ActionWrapper>) -> UInt {
    let callback : SGGCallback = { (s, o) in
        let action = unsafeBitCast(o, to: UnsafeMutablePointer<ActionWrapper>.self)
        action.pointee.perform()
    }
    
    let pointer = unsafeBitCast(action, to: UnsafeMutableRawPointer.self)
    return gtk_connect(source, signal, callback, pointer)
}

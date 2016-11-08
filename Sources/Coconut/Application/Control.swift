//
//  Control.swift
//  Coconut
//
//  Created by Dami on 07/10/2016.
//
//

import Foundation

class ActionWrapper : Action {
    
    var action: Action? = nil
    
    public func perform() {
        if let action = action {
            action.perform()
        }
    }
}

/// Define a view with action
public class Control : View, Action {

    internal var actionWrapper : ActionWrapper
    
    public var action: Action? {
        get {
            return actionWrapper.action
        }
        
        set {
            actionWrapper.action = newValue
        }
    }
    
    init(action: Action? = nil) {
        actionWrapper = ActionWrapper()
        self.actionWrapper.action = action
        super.init()
    }
    
    init(frame: NSRect, action: Action? = nil) {
        actionWrapper = ActionWrapper()
        self.actionWrapper.action = action
        super.init(frame: frame)
    }
    
    public func perform() {
        actionWrapper.perform()
    }
}

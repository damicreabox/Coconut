//
//  Action.swift
//  Coconut
//
//  Created by Dami on 07/10/2016.
//
//

import Foundation

public protocol Action {
    func perform()
}

public class OjectAction<C, T> : Action {
    
    let caller: C
    let target: T
    let action: (C, T) -> Void
    
    public init(caller: C, target: T, action: @escaping (C, T) -> Void) {
        self.caller = caller
        self.target = target
        self.action = action
    }
    
    public func perform() {
        action(caller, target)
    }
}

public class EmptyAction : Action {
    public func perform() {
        print("Empty action")
    }
    public init() {
    }
}

public class ExitAction : Action {
    public func perform() {
        Application.shared().terminate(nil)
    }
    public init() {
    }
}

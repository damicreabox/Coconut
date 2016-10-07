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

class EmptyAction : Action {
    public func perform() {
        print("Empty action")
    }
}

class ExitAction : Action {
    public func perform() {
        Application.shared().terminate(nil)
    }
}

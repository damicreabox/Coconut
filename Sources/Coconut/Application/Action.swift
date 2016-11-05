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

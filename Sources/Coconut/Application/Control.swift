//
//  Control.swift
//  Coconut
//
//  Created by Dami on 07/10/2016.
//
//

import Foundation

/// Define a view with action
public class Control : View {

    public var action : Action
    
    override init() {
        action = EmptyAction()
        super.init()
    }
    
    init(action: Action) {
        self.action = action
        super.init()
    }
    
    public func perform() {
        action.perform()
    }
}

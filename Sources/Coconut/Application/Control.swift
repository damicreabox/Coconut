//
//  Control.swift
//  Coconut
//
//  Created by Dami on 07/10/2016.
//
//

import Foundation

public class Control : View {
    
    private var actionSelector: Selector? = nil
    
    public var action: Selector? {
        
        get {
            return actionSelector
        }
        
        set {
            self.actionSelector = action
        }
    }
    
    private weak var actionTarget: AnyObject? = nil
    
    weak var target: AnyObject? {
        get{
            return actionTarget
        }
        set{
            actionTarget = target
        }
    }
}

//
//  Control.swift
//  Coconut
//
//  Created by Dami on 07/10/2016.
//
//

import Foundation

public class Control : View {

    public internal(set) var action : Action
    
    init(action: Action) {
        self.action = action
        super.init()
    }
}

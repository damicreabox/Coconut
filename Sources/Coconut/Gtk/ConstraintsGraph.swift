//
//  ConstraintsGraph.swift
//  Sample-coconut
//
//  Created by Dami on 10/11/2016.
//
//

import Foundation

class ConstraintsNode {
    
    weak var view: View?
    
    var topDico = Dictionary<String, ConstraintsNode> ()
    var top = [ConstraintsNode]()
    
    var bottomDico = Dictionary<String, ConstraintsNode> ()
    var bottom = [ConstraintsNode]()
    
    var leftDico = Dictionary<String, ConstraintsNode> ()
    var left = [ConstraintsNode]()
    
    var rightDico = Dictionary<String, ConstraintsNode> ()
    var right = [ConstraintsNode]()
    
    var vCenterDico = Dictionary<String, ConstraintsNode> ()
    var vCenter = [ConstraintsNode]()
    
    var hCenterDico = Dictionary<String, ConstraintsNode> ()
    var hCenter = [ConstraintsNode]()
    
    init(view: View) {
        self.view = view
    }
}

class ConstraintsGraph {
    
    weak var view: View?
    
    var verticalsDico = Dictionary<String, ConstraintsNode> ()
    var verticals = [ConstraintsNode]()
    
    var horizontalsDico = Dictionary<String, ConstraintsNode> ()
    var horizontals = [ConstraintsNode]()
    
    var orphansDico = Dictionary<String, ConstraintsNode> ()
    var orphans = [ConstraintsNode]()
    
    init(view: View?) {
        self.view = view
    }
}

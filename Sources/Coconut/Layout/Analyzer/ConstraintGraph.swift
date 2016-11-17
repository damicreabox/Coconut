//
//  ConstraintGraph.swift
//  Coconut
//
//  Created by Dami on 17/11/2016.
//
//

import Foundation

/// Constraint node.
/// Containing View and all links with other view.
class ConstraintNode {
    
    ///
    /// View
    ///
    var view: View
    
    /// Verticals constraints
    var verticals = [ConstraintLink] ()
    
    /// Horintals constraints
    var horizontals = [ConstraintLink] ()
    
    init(view: View) {
        self.view = view
    }
    
    ///
    /// Add vertical constraint.
    ///
    func add(vertical: ConstraintLink) {
       self.verticals.append(vertical)
    }
    
    ///
    /// Add horizontal constraint.
    ///
    func add(horizontal: ConstraintLink) {
        self.horizontals.append(horizontal)
    }
}

/// Link with another node
class ConstraintLink {
    
    /// Constraint node
    var node: ConstraintNode
    
    /// Source constraint type
    var sourceConstraintType: LayoutConstraintType? = nil
    
    /// Destination constraint type
    var destinationConstraintType: LayoutConstraintType? = nil
    
    init(node: ConstraintNode) {
        self.node = node
    }
}

/// Constraint graph
class ConstrainGraph : ConstraintNode {
    
    /// All nodes by view
    var nodes = Dictionary<View, ConstraintNode> ()
    
    /// Find or create node from view
    func get(view: View) -> ConstraintNode {
        if let node = nodes[view] {
            return node
        } else {
            let node = ConstraintNode(view: view)
            nodes[view] = node
            return node
        }
    }
}

//
//  ConstraintAnalyzer
//  Coconut
//
//  Created by Dami on 17/11/2016.
//
//

import Foundation

class ConstraintAnalyzer {
    
    var view: View
    
    init(view: View) {
        self.view = view
    }
    
    func add(constraint: LayoutConstraint, to graph: ConstrainGraph) {
        
        if let firstView = constraint.firstView, let firstType = constraint.firstViewConstraint {
            
            if let secondView = constraint.secondView, let secondType = constraint.secondViewConstraint {
                
                
            }
        }
    }
    
    func add(view: View, to graph: ConstrainGraph) {
        
        if let _ = graph.nodes[view] {
            return
        }
        
        // Init node
        _ = graph.get(view: view)

        
        // Add all sub views
        for subView in view.views {
            add(view: subView, to: graph)
        }
        
        // Ajout des constraints
        for constraint in view.constraints {
            add(constraint: constraint, to: graph)
        }
    }
    
    func buildConstraintGraph() -> ConstrainGraph {
        
        // Create graph
        let graph = ConstrainGraph(view: view)
        
        // Add view
        add(view: view, to: graph)
        
        return graph
    }
    
    func build() {
        let constraintGraph = buildConstraintGraph()
    }
}

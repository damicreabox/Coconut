//
//  ConstraintAnalyzer
//  Coconut
//
//  Created by Dami on 17/11/2016.
//
//

import Foundation

/// Analyze view with constraints
class ConstraintAnalyzer {
    
    /// Parent view
    var view: View
    
    init(view: View) {
        self.view = view
    }
    
    // ---- Constraints ----
    
    private func get(view: View, graph: ConstrainGraph) -> ItemNode {
        
        if let item = graph.nodes[view] {
            return item
        }
        
        return add(view: view, to: graph)
    }
    
    /// Add constraint into the graph
    private func add(constraint: LayoutConstraint, to graph: ConstrainGraph) {
        
        if let firstView = constraint.firstView, let firstType = constraint.firstViewConstraint {
            
            if let secondView = constraint.secondView, let secondType = constraint.secondViewConstraint {
                
                // Find source node
                let sourceNode = get(view: firstView, graph: graph)
                
                // Find destination node
                let destinationNode = get(view: secondView, graph: graph)
                
                // Create link
                let nodeConstraint = ItemNodeConstraint(source: firstType,
                                                        destination: secondType)
                
                sourceNode.add(constraint: nodeConstraint, for: destinationNode)
            }
        }
    }
    
    /// Add view into the graph
    private func add(view: View, to graph: ConstrainGraph) -> ItemNode {
        
        if let item = graph.nodes[view] {
            return item
        }
        
        // Init node
        let item = graph.get(view: view)

        
        // Add all sub views
        for subView in view.views {
            _ = add(view: subView, to: graph)
        }
        
        // Ajout des constraints
        for constraint in view.constraints {
            add(constraint: constraint, to: graph)
        }
        
        return item
    }
    
    /// Build graph constraint
    func buildConstraintGraph() -> ConstrainGraph {
        
        // Create graph
        let graph = ConstrainGraph(view: view)
        
        // Add view
        _ = add(view: view, to: graph)
        
        return graph
    }
    
    // ---- Layout ----
    
    private func verticalBoxContainer(from node: ItemNode, of graph: ConstrainGraph, statistics: LayoutNodeStatistics) -> LayoutContainer {
        
        var items = [LayoutItem] ()
        
        for view in statistics.entryPoints {
            
            // FIXME Limiter l'analyse en horizontal
            items.append(item(node: graph.get(view: view), of: graph))
            
            // Parcourir est ajouter
        }
        
        return LayoutContainer(items: items, type: .verticalBox)
    }
    
    private func horizontalBoxContainer(from node: ItemNode, of graph: ConstrainGraph, statistics: LayoutNodeStatistics) -> LayoutContainer {
        
        var items = [LayoutItem] ()
        
        for view in statistics.entryPoints {
            
            // FIXME Limiter l'analyse en vertical
            items.append(item(node: graph.get(view: view), of: graph))
            
            // Parcourir est ajouter
        }
        
        return LayoutContainer(items: items, type: .horizontalBox)
    }
    
    private func gridBoxContainer(from node: ItemNode, of graph: ConstrainGraph, statistics: LayoutNodeStatistics) -> LayoutContainer {
        var items = [LayoutItem] ()
        
        for view in statistics.entryPoints {
            
            // FIXME Limiter l'analyse en container
            items.append(item(node: graph.get(view: view), of: graph))
            
            // Parcourir est ajouter en gardant un index
        }
        
        return LayoutContainer(items: items, type: .grid)
    }
    
    private func constraintContainer(from node: ItemNode, of graph: ConstrainGraph, statistics: LayoutNodeStatistics) -> LayoutContainer {
        
        // Test columns
        if (statistics.maxColumns == 1) {
            return verticalBoxContainer(from: node, of: graph, statistics: statistics)
        } else {
            
            // Test columns
            if (statistics.maxLines == 1) {
                return horizontalBoxContainer(from: node, of: graph, statistics: statistics)
            } else {
                return gridBoxContainer(from: node, of: graph, statistics: statistics)
            }
        }
    }
    
    private func fixedContainer(from node: ItemNode, of graph: ConstrainGraph, and views: Set<View>) -> LayoutContainer {
        
        // Create sub item container
        var items = [LayoutItem] ()
        
        // Add views
        for view in views {
            let subItem = item(node: graph.get(view: view), of: graph)
            items.append(subItem)
        }
        
        return LayoutContainer(items: items, type: .fixed)
    }
    
    private func multiContainer(from node: ItemNode, of graph: ConstrainGraph, and containers: [LayoutContainer]) -> LayoutContainer {
        return LayoutContainer(items: containers, type: .fixed)
    }
    
    private func container(from node: ItemNode, of graph: ConstrainGraph) -> LayoutContainer {
        
        // Analyze container
        let statistics = graph.statistics(of: node)
        
        // Create constraints containers
        var containers = [LayoutContainer] ()
        
        // Test entry points
        if (!statistics.entryPoints.isEmpty) {
            containers.append(constraintContainer(from: node, of: graph, statistics: statistics))
        }
        
        
        // Test orphans
        let orphans = statistics.orphans
        if !orphans.isEmpty {
            containers.append(fixedContainer(from: node, of: graph, and: orphans))
        }
        
        // Test unique
        if containers.count == 1 {
            return containers.first!
        } else {
            return multiContainer(from: node, of: graph, and: containers)
        }
    }
    
    private func item(node: ItemNode, of graph: ConstrainGraph) -> LayoutItem {
        
        // Test si c'est un container
        if (node.count > 0 || node.view.views.count > 0) {
            return container(from: node, of: graph)
        } else {
            return LayoutView(view: node.view)
        }
    }
    
    
    private func convert(graph: ConstrainGraph) -> LayoutItem {
        return item(node: graph.get(view: graph.view), of: graph)
    }
    
    func build() -> LayoutItem {
        
        // Build constraint graph
        let constraintGraph = buildConstraintGraph()
                
        return convert(graph: constraintGraph)
    }
}

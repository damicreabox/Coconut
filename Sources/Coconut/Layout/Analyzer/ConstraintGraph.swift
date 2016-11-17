//
//  ConstraintGraph.swift
//  Coconut
//
//  Created by Dami on 17/11/2016.
//
//

import Foundation

/// Define view node constraints
class ItemNode : NSObject {

    /// View to display
    var view: View
    
    /// All constraints for this node, groups by other views
    private(set) var itemConstraints = Dictionary<View, [ItemNodeConstraint]>()
    
    subscript(view: View) -> [ItemNodeConstraint] {
        if let constraints = itemConstraints[view] {
            return constraints
        } else {
            return [ItemNodeConstraint]()
        }
    }
    
    /// Count the number of others views used in constraints
    var count: Int {
        get {
            return itemConstraints.count
        }
    }
    
    var views: [View] {
        get {
            return [View](itemConstraints.keys)
        }
    }
    
    /// Add a constraint
    func add(constraint: ItemNodeConstraint, for view: ItemNode) {
        
        var constraints: [ItemNodeConstraint]
        if let viewConstraints = itemConstraints[view.view] {
            constraints = viewConstraints
        } else {
            constraints = [ItemNodeConstraint]()
            constraints.append(constraint)
            itemConstraints[view.view] = constraints
        }
    }
    
    
    init(view: View) {
        self.view = view
    }
}

/// Define a constraint to another view
class ItemNodeConstraint {
    
    /// Source constraint type
    var source: LayoutAttribute
    
    /// Destination constraint type
    var destination: LayoutAttribute
    
    /// Constante used by the constraint
    var constante: Any? = nil
    
    init(source: LayoutAttribute, destination: LayoutAttribute) {
        self.source = source
        self.destination = destination
    }
}

class LayoutNodeStatistics {
    
    private var graph: ConstrainGraph
    
    private var useds = Set<View>()
    private(set) var orphans: Set<View>
    private(set) var entryPoints = Set<View>()
    
    private(set) var maxLines = 1
    private(set) var maxColumns = 1
    
    init(graph: ConstrainGraph, views: [View]) {
        self.graph = graph
        self.orphans = Set<View>(views)
    }
    
    func mark(used: View) {
        orphans.remove(used)
        if !useds.contains(used) {
            entryPoints.insert(used)
            useds.insert(used)
        }
    }
    
    func used(view: View) -> Bool {
        return useds.contains(view)
    }
    
    func mark(positioned: View) {
        entryPoints.remove(positioned)
        orphans.remove(positioned)
        useds.insert(positioned)
    }
    
    func max(columns: Int) {
        if columns > maxColumns {
            maxColumns = columns
        }
    }
    
    func max(lines: Int) {
        if lines > maxLines {
            maxLines = lines
        }
    }
}

struct StatisticsUpdater {
    
    let statistics : LayoutNodeStatistics
    
    var lines: Int
    var columns: Int
    
    init(statistics: LayoutNodeStatistics, lines: Int? = nil, columns: Int? = nil) {
        self.statistics = statistics
        self.lines = lines == nil ? statistics.maxLines : lines!
        self.columns = columns == nil ? statistics.maxColumns : columns!
    }
    
    func mark(used view: View) {
        statistics.mark(used: view)
    }
    
    func mark(positioned view: View) {
        statistics.mark(positioned: view)
    }
    
    func addLine() -> StatisticsUpdater {
        let newLines = lines + 1
        statistics.max(lines: newLines)
        return StatisticsUpdater(statistics: statistics, lines: newLines, columns: columns)
    }
    
    func addColumn() -> StatisticsUpdater {
        let newColumns = columns + 1
        statistics.max(columns: newColumns)
        return StatisticsUpdater(statistics: statistics, lines: lines, columns: newColumns)
    }
}

/// Constraint graph
class ConstrainGraph {
    
    var view: View
    
    /// All nodes by view
    var nodes = Dictionary<View, ItemNode> ()
    
    init(view: View) {
        self.view = view
    }
    
    /// Find or create node from view
    func get(view: View) -> ItemNode {
        if let node = nodes[view] {
            return node
        } else {
            let node = ItemNode(view: view)
            nodes[view] = node
            return node
        }
    }
    
    private func update(node: ItemNode, statisticsUpdater: StatisticsUpdater) {
        
        // Test all subviews
        for view in node.view.views {
            
            // Find node
            let viewNode = get(view: view)
            
            // Find view contraints
            for (subView, constraints) in viewNode.itemConstraints {
                
                // Test all constraints
                for constraint in constraints {
                    switch constraint.source {
                        
                    case .left:
                        if constraint.destination == .right {
                            statisticsUpdater.mark(positioned: view)
                            statisticsUpdater.mark(used: subView)
                            update(node: viewNode, statisticsUpdater: statisticsUpdater.addColumn())
                        }
                        
                    case .top:
                        if constraint.destination == .bottom {
                            statisticsUpdater.mark(positioned: view)
                            statisticsUpdater.mark(used: subView)
                            update(node: viewNode, statisticsUpdater: statisticsUpdater.addLine())
                        }
                        
                    default:
                        continue
                    }
                }
            }
        }
    }
    
    func statistics(of node: ItemNode) -> LayoutNodeStatistics {
        
        let statistics = LayoutNodeStatistics(graph: self, views: node.view.views)
        
        // Update statistics
        update(node: node, statisticsUpdater: StatisticsUpdater(statistics: statistics))
        
        return statistics
    }
}

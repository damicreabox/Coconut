//
//  LayoutAnalyzerTest.swift
//  Coconut
//
//  Created by Dami on 18/11/2016.
//
//

import XCTest

@testable import Coconut

class LayoutAnalyzerSimpleItemTest: XCTestCase {

    // --- Simple view ---
    
    func testViewWithoutFrameAndConstraint() {
        
        // Create simple view without frame
        let view = LayoutAnalyzerTestTools.create(view: "v1")
        
        // Create analyzer
        let analyzer = ConstraintAnalyzer(view: view)
        
        // Create graph
        let constraintGraph = analyzer.buildConstraintGraph()
        XCTAssertEqual(constraintGraph.nodes.count, 1)
        XCTAssertEqual(constraintGraph.nodes[view]?.count, 0)
        
        // Analyze view
        let result = analyzer.build();
        XCTAssertEqual(result.itemType, LayoutItemType.view)
    }
    
    func testViewWithoutConstraint() {
        
        // Create simple view with frame
        let frame = NSRect(origin: NSPoint(x: 0, y: 0), size: NSSize(width: 100, height: 40))
        let view = LayoutAnalyzerTestTools.create(view: "v1", frame: frame)
        
        // Create analyzer
        let analyzer = ConstraintAnalyzer(view: view)
        
        // Create graph
        let constraintGraph = analyzer.buildConstraintGraph()
        XCTAssertEqual(constraintGraph.nodes.count, 1)
        XCTAssertEqual(constraintGraph.nodes[view]?.count, 0)
        
        // Analyze view
        let result = analyzer.build();
        XCTAssertEqual(result.itemType, LayoutItemType.view)
    }

    // --- Simple container ---
    
    func testContainerWithoutFrameAndConstraint() {
        
        // Create container without frame
        let container = LayoutAnalyzerTestTools.create(view: "c1")
        
        // Create simple view with frame
        let view = LayoutAnalyzerTestTools.create(view: "v1")
        container.addSubview(view)
        
        // Create analyzer
        let analyzer = ConstraintAnalyzer(view: container)
        
        // Create graph
        let constraintGraph = analyzer.buildConstraintGraph()
        XCTAssertEqual(constraintGraph.nodes.count, 2)
        XCTAssertEqual(constraintGraph.nodes[container]?.count, 0)
        XCTAssertEqual(constraintGraph.nodes[view]?.count, 0)
        
        // Analyze view
        let result = analyzer.build();
        XCTAssertEqual(result.itemType, LayoutItemType.container)
        
        let layoutContainer = result as! LayoutContainer
        XCTAssertEqual(layoutContainer.containerType, .fixed)
        XCTAssertEqual(layoutContainer.items.count, 1)
    }
    
    func testContainerWithoutConstraint() {
        
        // Create simple view with frame
        let frame = NSRect(origin: NSPoint(x: 0, y: 0), size: NSSize(width: 100, height: 40))
        
        // Create container without frame
        let container = LayoutAnalyzerTestTools.create(view: "c1", frame: frame)
        
        // Create simple view
        let view = LayoutAnalyzerTestTools.create(view: "v1")
        container.addSubview(view)
        
        // Create analyzer
        let analyzer = ConstraintAnalyzer(view: container)
        
        // Create graph
        let constraintGraph = analyzer.buildConstraintGraph()
        XCTAssertEqual(constraintGraph.nodes.count, 2)
        XCTAssertEqual(constraintGraph.nodes[container]?.count, 0)
        XCTAssertEqual(constraintGraph.nodes[view]?.count, 0)
        
        // Analyze view
        let result = analyzer.build();
        XCTAssertEqual(result.itemType, LayoutItemType.container)
        
        let layoutContainer = result as! LayoutContainer
        XCTAssertEqual(layoutContainer.containerType, .fixed)
        XCTAssertEqual(layoutContainer.items.count, 1)
    }
    
    // --- Simple container ---
    
    func testContainerMultiViewWithoutFrameAndConstraint() {
        
        // Create container without frame
        let container = LayoutAnalyzerTestTools.create(view: "c1")
        
        // Create simple view with frame
        let view1 = LayoutAnalyzerTestTools.create(view: "v1")
        let view2 = LayoutAnalyzerTestTools.create(view: "v2")
        container.addSubview(view1)
        container.addSubview(view2)
        
        // Create analyzer
        let analyzer = ConstraintAnalyzer(view: container)
        
        // Create graph
        let constraintGraph = analyzer.buildConstraintGraph()
        XCTAssertEqual(constraintGraph.nodes.count, 3)
        XCTAssertEqual(constraintGraph.nodes[container]?.count, 0)
        XCTAssertEqual(constraintGraph.nodes[view1]?.count, 0)
        XCTAssertEqual(constraintGraph.nodes[view2]?.count, 0)
        
        // Analyze view
        let result = analyzer.build();
        XCTAssertEqual(result.itemType, .container)
        
        let layoutContainer = result as! LayoutContainer
        XCTAssertEqual(layoutContainer.containerType, .fixed)
        XCTAssertEqual(layoutContainer.items.count, 2)
    }
    
    func testContainerMultiViewWithoutConstraint() {
        
        // Create simple view with frame
        let frame1 = NSRect(origin: NSPoint(x: 0, y: 0), size: NSSize(width: 100, height: 40))
        let frame2 = NSRect(origin: NSPoint(x: 0, y: 40), size: NSSize(width: 100, height: 40))
        
        // Create container without frame
        let container = LayoutAnalyzerTestTools.create(view: "c1")
        
        // Create simple view with frame
        let view1 = LayoutAnalyzerTestTools.create(view: "v1", frame: frame1)
        let view2 = LayoutAnalyzerTestTools.create(view: "v2", frame: frame2)
        container.addSubview(view1)
        container.addSubview(view2)
        
        // Create analyzer
        let analyzer = ConstraintAnalyzer(view: container)
        
        // Create graph
        let constraintGraph = analyzer.buildConstraintGraph()
        XCTAssertEqual(constraintGraph.nodes.count, 3)
        XCTAssertEqual(constraintGraph.nodes[container]?.count, 0)
        XCTAssertEqual(constraintGraph.nodes[view1]?.count, 0)
        XCTAssertEqual(constraintGraph.nodes[view2]?.count, 0)
        
        // Analyze view
        let result = analyzer.build();
        XCTAssertEqual(result.itemType, .container)
        
        let layoutContainer = result as! LayoutContainer
        XCTAssertEqual(layoutContainer.containerType, .fixed)
        XCTAssertEqual(layoutContainer.items.count, 2)
    }
}

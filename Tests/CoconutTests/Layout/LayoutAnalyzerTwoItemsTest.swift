//
//  LayoutAnalyzerTwoItemsTest.swift
//  Coconut
//
//  Created by Dami on 18/11/2016.
//
//

import XCTest

@testable import Coconut

class LayoutAnalyzerTwoItemsTest: XCTestCase {

    func testVertical() {
        
        // Create container without frame
        let container = LayoutAnalyzerTestTools.create(view: "c1")
        
        // Create simple view with frame
        let view1 = LayoutAnalyzerTestTools.create(view: "v1")
        let view2 = LayoutAnalyzerTestTools.create(view: "v2")
        container.addSubview(view1)
        container.addSubview(view2)
        
        // Add constraint from v1 -> v2
        container.constraints.append(
            LayoutConstraint(item: view2, attribute: LayoutAttribute.top,
                             toItem: view1, attribute: LayoutAttribute.bottom)
        )
        
        // Create analyzer
        let analyzer = ConstraintAnalyzer(view: container)
        
        // Create graph
        let constraintGraph = analyzer.buildConstraintGraph()
        XCTAssertEqual(constraintGraph.nodes.count, 3)
        XCTAssertEqual(constraintGraph.nodes[container]?.count, 0)
        XCTAssertEqual(constraintGraph.nodes[view1]?.count, 0)
        XCTAssertEqual(constraintGraph.nodes[view2]?.count, 1)
        
        // Analyze view
        let result = analyzer.build();
        XCTAssertEqual(result.itemType, .container)
        
        let layoutContainer = result as! LayoutContainer
        XCTAssertEqual(layoutContainer.containerType, .fixed)
        XCTAssertEqual(layoutContainer.items.count, 2)
    }
    
    func testHorizontal() {
        
        // Create container without frame
        let container = LayoutAnalyzerTestTools.create(view: "c1")
        
        // Create simple view with frame
        let view1 = LayoutAnalyzerTestTools.create(view: "v1")
        let view2 = LayoutAnalyzerTestTools.create(view: "v2")
        container.addSubview(view1)
        container.addSubview(view2)
        
        // Add constraint from v1 -> v2
        container.constraints.append(
            LayoutConstraint(item: view2, attribute: LayoutAttribute.left,
                             toItem: view1, attribute: LayoutAttribute.right)
        )
        
        // Create analyzer
        let analyzer = ConstraintAnalyzer(view: container)
        
        // Create graph
        let constraintGraph = analyzer.buildConstraintGraph()
        XCTAssertEqual(constraintGraph.nodes.count, 3)
        XCTAssertEqual(constraintGraph.nodes[container]?.count, 0)
        XCTAssertEqual(constraintGraph.nodes[view1]?.count, 0)
        XCTAssertEqual(constraintGraph.nodes[view2]?.count, 1)
        
        // Analyze view
        let result = analyzer.build();
        XCTAssertEqual(result.itemType, .container)
        
        let layoutContainer = result as! LayoutContainer
        XCTAssertEqual(layoutContainer.containerType, .fixed)
        XCTAssertEqual(layoutContainer.items.count, 2)
    }

}

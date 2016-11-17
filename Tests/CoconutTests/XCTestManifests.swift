//
//  XCTestManifests.swift
//  Coconut
//
//  Created by Dami on 18/11/2016.
//
//

import Foundation

extension LayoutAnalyzerSimpleItemTest {
    
    static var allTests = [
        ("testViewWithoutFrameAndConstraint", testViewWithoutFrameAndConstraint),
        ("testViewWithoutConstraint", testViewWithoutConstraint),
        ("testContainerWithoutFrameAndConstraint", testContainerWithoutFrameAndConstraint),
        ("testContainerWithoutConstraint", testContainerWithoutConstraint),
    ]
}

extension LayoutAnalyzerTwoItemsTest {
    
    static var allTests = [
        ("testVertical", testVertical),
        ("testHorizontal", testHorizontal),
        ]
}

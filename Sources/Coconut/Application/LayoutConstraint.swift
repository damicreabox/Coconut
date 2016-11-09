//
//  UiConstraint.swift
//  Sample-coconut
//
//  Created by Dami on 09/11/2016.
//
//

import Foundation

public enum ViewConstraintType {
    case top
    case bottom
    case left
    case right
    case centerX
    case centerY
}

public class LayoutConstraint {
    
    public let firstView: View?
    public let firstViewConstraint: ViewConstraintType?
    
    public let secondView: View?
    public let secondViewConstraint: ViewConstraintType?
    
    public let constant: Any?
    
    public init() {
        self.firstView = nil
        self.firstViewConstraint = nil
        self.secondView = nil
        self.secondViewConstraint = nil
        self.constant = nil
    }
    
    public init(firstView: View? = nil, firstViewConstraint: ViewConstraintType? = nil,
                secondView: View? = nil, secondViewConstraint: ViewConstraintType? = nil,
                constant: Any? = nil) {
        self.firstView = firstView
        self.firstViewConstraint = firstViewConstraint
        self.secondView = secondView
        self.secondViewConstraint = secondViewConstraint
        self.constant = constant
    }
}

//
//  UiConstraint.swift
//  Sample-coconut
//
//  Created by Dami on 09/11/2016.
//
//

import Foundation

public enum LayoutConstraintType {
    case top
    case bottom
    case left
    case right
    case centerX
    case centerY
}

public class LayoutConstraint {
    
    public let firstView: View?
    public let firstViewConstraint: LayoutConstraintType?
    
    public let secondView: View?
    public let secondViewConstraint: LayoutConstraintType?
    
    public let constant: Any?
    
    public init() {
        self.firstView = nil
        self.firstViewConstraint = nil
        self.secondView = nil
        self.secondViewConstraint = nil
        self.constant = nil
    }
    
    public init(firstView: View? = nil, firstViewConstraint: LayoutConstraintType? = nil,
                secondView: View? = nil, secondViewConstraint: LayoutConstraintType? = nil,
                constant: Any? = nil) {
        self.firstView = firstView
        self.firstViewConstraint = firstViewConstraint
        self.secondView = secondView
        self.secondViewConstraint = secondViewConstraint
        self.constant = constant
    }
}

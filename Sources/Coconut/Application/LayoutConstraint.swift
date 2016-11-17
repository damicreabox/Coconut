//
//  UiConstraint.swift
//  Sample-coconut
//
//  Created by Dami on 09/11/2016.
//
//

import Foundation

public enum LayoutAttribute {
    case top
    case bottom
    case left
    case right
    case centerX
    case centerY
}

public class LayoutConstraint {
    
    public let firstView: View?
    public let firstViewConstraint: LayoutAttribute?
    
    public let secondView: View?
    public let secondViewConstraint: LayoutAttribute?
    
    public let constant: Any?
    
    public init(firstView: View? = nil, firstViewConstraint: LayoutAttribute? = nil,
                secondView: View? = nil, secondViewConstraint: LayoutAttribute? = nil,
                constant: Any? = nil) {
        self.firstView = firstView
        self.firstViewConstraint = firstViewConstraint
        self.secondView = secondView
        self.secondViewConstraint = secondViewConstraint
        self.constant = constant
    }
    
    convenience init(item view1: View,
                     attribute attr1: LayoutAttribute,
                     relatedBy relation: NSLayoutRelation? = nil,
                     toItem view2: View? = nil,
                     attribute attr2: LayoutAttribute? = nil,
                     multiplier: Float? = nil,
                     constant c: Float? = nil){
        self.init(firstView: view1, firstViewConstraint:attr1,
                  secondView: view2,
                  secondViewConstraint: attr2, constant: c)
    }
}

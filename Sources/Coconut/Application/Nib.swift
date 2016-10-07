//
//  Nib.swift
//  Coconut
//
//  Created by Dami on 06/10/2016.
//
//

import Foundation

public class Nib {
    
    private var name : String
    private var bundle : Bundle?
    
    private var object : Any?
    
    init?(nibNamed nibName: String,
          bundle: Bundle?) {
        self.name = nibName
        self.bundle = bundle
    }
    
    public func instantiate(withOwner owner: Any?,
                     topLevelObjects: AutoreleasingUnsafeMutablePointer<NSArray>?) -> Bool {
        
        switch name {
        case "mainNib":
            
            // Create main nib
            guard let mainNibSample = MainNibSample(withOwner: owner) else {
                return false
            }
            
            // Set object
            object = mainNibSample
            
            return true
            
        default:
            return false
        }
    }
}

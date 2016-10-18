//
//  Nib.swift
//  Coconut
//
//  Created by Dami on 06/10/2016.
//
//

import Foundation

/// Class to define an UI
public class UIDefinition {
    
    /// UI file name
    private var name : String
    
    /// Bundle
    private var bundle : Bundle?
    
    init?(name: String, bundle: Bundle?) {
        self.name = name
        self.bundle = bundle
    }
    
    public func instantiate(owner: Any?, topLevelObjects: UnsafeMutablePointer<NSArray>? = nil) -> Bool {
        return UIFactoryManager.instance.newInstance(name: name, owner: owner)
    }
}

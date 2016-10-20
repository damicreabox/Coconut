//
//  Nib.swift
//  Coconut
//
//  Created by Dami on 06/10/2016.
//
//

import Foundation

public protocol UIDefinitionDelegate {
    func instantiate(owner: Any?, objects: [NSObjectProtocol]?) -> Bool
}

/// Class to define an UI
public class UIDefinition {
    
    /// Internal UIDelegate
    private var uiDelegate: UIDefinitionDelegate? = nil
    
    /// UI file name
    private var name : String
    
    /// Bundle
    private var bundle : Bundle?
    
    init?(name: String, bundle: Bundle?) {
        self.name = name
        self.bundle = bundle
    }
    
    public func instantiate(owner: Any?, objects: [NSObjectProtocol]? = nil) -> Bool {
        
        // Create new instance
        uiDelegate = UIFactoryManager.instance.newInstance(name: name)
        if (uiDelegate == nil) {
            return false
        }
        
        // Instanciate
        return uiDelegate!.instantiate(owner: owner, objects: objects)
    }
}

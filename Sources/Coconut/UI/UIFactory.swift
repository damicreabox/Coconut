//
//  UIDefinition.swift
//  Coconut
//
//  Created by Dami on 18/10/2016.
//
//

import Foundation

/// Objet to register all UI factories
public class UIFactoryManager {
    
    /// Unique instance
    public static let instance = UIFactoryManager()
    
    /// Dictionary containing all mappings
    private var mappings = Dictionary<String, UIFactory>()
    
    /// Register factory for an UI
    public func register(name: String, factory: UIFactory) {
        mappings[name] = factory
    }
    
    /// Create new UI instance using name.
    func newInstance(name: String, owner: Any?) -> Bool {
        guard let result = mappings[name]?.newInstance(owner: owner) else {
            // FIXME Add log unable to find factory
            return false;
        }
        return result
    }
}

// Define an UI factory
public protocol UIFactory {
    func newInstance(owner: Any?) -> Bool
}

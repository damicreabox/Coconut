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
    private var mappings = Dictionary<String, () -> UIDefinitionDelegate>()
    
    /// Register factory for an UI
    public func register(name: String, factory: @escaping () -> UIDefinitionDelegate) {
        mappings[name] = factory
    }
    
    /// Create new UI instance using name.
    func newInstance(name: String) -> UIDefinitionDelegate? {
        return mappings[name]?()
    }
}

// Define an UI factory
public protocol UIFactory {
    func newInstance() -> UIDefinitionDelegate
}

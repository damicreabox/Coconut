//
//  File.swift
//  Coconut
//
//  Created by Dami on 19/10/2016.
//
//

import Foundation


public class UIDefinitionNode {
    public var objects: Dictionary<String, UIObjectNode>
    init(objects: Dictionary<String, UIObjectNode>) {
        self.objects = objects
    }
}

public class UIObjectNode {
    
    public let id: String
    public let className: String
    public let module: String?
    
    public let connections: [Connection]
    
    init(id: String, className: String, module: String? = nil, connections: [Connection]) {
        self.id = id
        self.className = className
        self.module = module
        self.connections = connections
    }
    
}

public enum ConnectionType {
    case action
    case outlet
}

public protocol Connection {
    var id: String {
        get
    }
    var type: ConnectionType {
        get
    }
}

public class Action : Connection {
    public let id: String
    public let type = ConnectionType.action
    init(id: String) {
        self.id = id
    }
}

public class Outlet : Connection {
    public let id: String
    public let type = ConnectionType.outlet
    init(id: String) {
        self.id = id
    }
}

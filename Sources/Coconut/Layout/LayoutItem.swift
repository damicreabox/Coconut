//
//  LayoutItem.swift
//  Coconut
//
//  Created by Dami on 18/11/2016.
//
//

import Foundation

enum LayoutItemType {
    case view
    case container
}

/// Layout item
protocol LayoutItem {
    var itemType: LayoutItemType {
        get
    }
}

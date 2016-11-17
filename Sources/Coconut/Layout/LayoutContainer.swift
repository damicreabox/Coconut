//
//  LayoutContainer.swift
//  Coconut
//
//  Created by Dami on 18/11/2016.
//
//

import Foundation

/// Define container types
///
/// - container: Container of containers, for internal usage.
/// - verticalBox: Define one column container.
/// - horizontalBox: Define one line container.
/// - grid: Define gris container (line x column)
/// - fixed: Define position container.
enum LayoutContainerType {
    case container
    case verticalBox
    case horizontalBox
    case grid
    case fixed
}

class LayoutContainer : LayoutItem {

    let containerType: LayoutContainerType
    let items : [LayoutItem]
    
    let itemType = LayoutItemType.container

    init(items: [LayoutItem], type : LayoutContainerType) {
        self.items = items
        self.containerType = type
    }
}

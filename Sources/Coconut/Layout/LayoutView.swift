//
//  LayoutView.swift
//  Coconut
//
//  Created by Dami on 18/11/2016.
//
//

import Foundation

/// Layout item containing view
class LayoutView : LayoutItem {
    
    /// View
    let view: View
    
    let itemType = LayoutItemType.view
    
    init(view: View) {
        self.view = view
    }
}

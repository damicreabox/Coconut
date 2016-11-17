//
//  LayoutAnalyzerTestTools.swift
//  Coconut
//
//  Created by Dami on 18/11/2016.
//
//

import Foundation

@testable import Coconut

class LayoutAnalyzerTestTools {
    
    static func create(view name: String, frame: NSRect? = nil) -> View {
        let view: View
        if let frame = frame {
            view = View(frame: frame)
        } else {
            view = View()
        }
        view.identifier = name
        
        return view
    }
}

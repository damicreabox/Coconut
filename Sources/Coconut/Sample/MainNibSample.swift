//
//  SaMainNibSample.swift
//  Coconut
//
//  Created by Dami on 06/10/2016.
//
//

import Foundation

class MainNibSample {
    
    // Delegate
    private let appDelegate : ApplicationDelegate
    
    // Window
    private let window : Window
    
    init?(withOwner owner: Any?) {
        
        guard owner != nil && owner is ApplicationDelegate  else {
            return nil
        }
        
        // Cast to app delegate
        appDelegate = owner as! ApplicationDelegate
        
        // Creation de la fenetre principal
        let rect = NSRect(x: 0, y: 0, width: 200, height: 200)
        window = Window(contentRect: rect)
        
        // Open window
        window.makeKeyAndOrderFront(window)
    }
}

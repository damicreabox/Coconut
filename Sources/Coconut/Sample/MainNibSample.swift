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
        window = Window(contentRect: NSRect(
                origin: NSPoint(x: 0, y: 0),
                size: NSSize(width: 200, height: 200)
            )
        )
        
        // Add buttons to view
        window.contentView?.addSubview(Button(title: "Hello button 1"))
        window.contentView?.addSubview(Button(title: "Hello button 2"))
        window.contentView?.addSubview(Button(title: "Hello button 3"))
        window.contentView?.addSubview(Button(title: "Hello button 4"))
        window.contentView?.addSubview(Button(title: "Hello button 5"))
        let quitButton = Button(title: "Quitter")
        window.contentView?.addSubview(quitButton)
        
        // Open window
        window.makeKeyAndOrderFront(window)
    }
}

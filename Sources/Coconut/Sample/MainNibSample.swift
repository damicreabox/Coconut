//
//  SaMainNibSample.swift
//  Coconut
//
//  Created by Dami on 06/10/2016.
//
//

import Foundation

public class MainNibSample : UIDefinitionDelegate {
    
    var window: Window? = nil
    
    
    
    
    public func instantiate(owner: Any?, objects: [NSObjectProtocol]?) -> Bool {
        
        guard owner != nil && owner is Application else {
            return false
        }
        
        // Set application
        let application = owner as! Application
        
        // Test obejcts
        guard objects != nil && objects!.count >= 2 else {
            return false
        }
        
        // Find delegate
        guard objects![1] is SimpleApplicationDelegate  else {
            return false
        }
        
        // Cast to app delegate
        let appDelegate = objects![1] as! SimpleApplicationDelegate
        
        // Creation de la fenetre principal
        window = Window(contentRect: NSRect(
                origin: NSPoint(x: 0, y: 0),
                size: NSSize(width: 200, height: 200)
            )
        )
        
        // Set window
        appDelegate.window = window
        
        // Add buttons to view
        window?.contentView?.addSubview(Button(title: "Hello button 1"))
        window?.contentView?.addSubview(Button(title: "Hello button 2"))
        window?.contentView?.addSubview(Button(title: "Hello button 3"))
        window?.contentView?.addSubview(Button(title: "Hello button 4"))
        window?.contentView?.addSubview(Button(title: "Hello button 5"))
        let quitButton = Button(title: "Quitter", action: ExitAction())
        window?.contentView?.addSubview(quitButton)
        
        // Open window
        window?.makeKeyAndOrderFront(window)
    
        return true
    }
}

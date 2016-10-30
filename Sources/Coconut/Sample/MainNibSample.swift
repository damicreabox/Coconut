//
//  SaMainNibSample.swift
//  Coconut
//
//  Created by Dami on 06/10/2016.
//
//

import Foundation


public class MainNibSample : UIDefinitionDelegate {
    
    // --- Implicit objects ---
    
    /// Application
    private let application: Application
    
    /// First responder
    private var firstResponder: Responder
    
    // --- External objects ---
    
    
    var window: Window? = nil
    
    init() {
        self.application = Application.shared()
        self.firstResponder = application
    }
    
    // --- Buttons ---
    
    
    
    public func instantiate(owner: Any?, objects: [NSObjectProtocol]?) -> Bool {
        
        guard owner != nil && owner is Application else {
            return false
        }
        
        // Set application
        //let application = owner as! Application
        
        // Test obejcts
        guard objects != nil && objects!.count >= 1 else {
            return false
        }
        
        // Find delegate
        guard objects![0] is SimpleApplicationDelegate  else {
            return false
        }
        
        // Cast to app delegate
        let appDelegate = objects![0] as! SimpleApplicationDelegate
        
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

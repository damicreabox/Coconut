//
//  Application.swift
//  Coconut
//
//  Created by Dami on 06/10/2016.
//
//

import Foundation

import CGtk

// Define an application
public class Application : Responder {
    
    /// Gtk application
    internal let app : UnsafeMutablePointer<GtkApplication>
    
    /// Main UI definiiton
    var mainUi : UIDefinition
    
    /// App delegate
    var delegate : ApplicationDelegate
    
    /// First responder
    var firstResponder: Responder? = nil
    
    /// Current App
    static var app : Application? = nil
    
    /// Return current App
    class func shared() -> NSApplication {
        return app!
    }
    
    init?(delegate: ApplicationDelegate, uiName name: String) {
        // Open ui
        guard let uiDefinition = UIDefinition(nibNamed: name, bundle: nil) else {
            return nil
        }
        
        self.delegate = delegate
        self.mainUi = uiDefinition
        
        // Init GTK library
        gtk_init(nil, nil)
        
        // Create application
        // FIXME GTK name
        app = gtk_application_new ("org.gtk.example", G_APPLICATION_FLAGS_NONE)
        
        super.init()
        
        // Set app
        Application.app = self
        
        // Laund main nib file
        guard mainUi.instantiate(owner: self, objects: [delegate]) else {
            // FIXME add log
            Application.app = nil
            return nil
        }
    }
    
    
    public func run() {
        
        // Application did finish launching
        delegate.applicationDidFinishLaunching(Notification(name: Notification.Name.init(rawValue: "NSApplicationDidFinishLaunching")))
        
        // Launch GTK main loop
        gtk_main ()
        
        // Application will terminate
        delegate.applicationWillTerminate(Notification(name: Notification.Name.init(rawValue: "NSApplicationWillTerminate")))
    }
    
    /// Terminate application
    func terminate(_ sender: Any?) {
        gtk_main_quit()
    }
}

public protocol ApplicationDelegate : NSObjectProtocol {
    func applicationDidFinishLaunching(_ aNotification: Notification)
    func applicationWillTerminate(_ aNotification: Notification)
}

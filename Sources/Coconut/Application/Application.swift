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
    
    /// Running
    private var running = false
    
    /// Gtk application
    lazy internal var app : UnsafeMutablePointer<GtkApplication> = {
        
        // Create application
        // FIXME GTK name
        return gtk_application_new ("org.gtk.example", G_APPLICATION_FLAGS_NONE)
        
    } ()
    
    /// Main UI definiiton
    var mainUi : UIDefinition? = nil
    
    /// App delegate
    public var delegate : ApplicationDelegate? = nil
    
    /// First responder
    var firstResponder: Responder? = nil
    
    /// Current App
    static var app : Application? = nil
    
    /// Return current App
    public class func shared() -> NSApplication {
        if app == nil {
            app = Application()
        }
        return app!
    }
    
    override init() {
        super.init()
        
        // Init GTK library
        gtk_init(nil, nil)
        
        // Set app
        Application.app = self
    }
    
    convenience init?(delegate: ApplicationDelegate, uiName name: String) {
        
        self.init()
        
        // Open ui
        guard let uiDefinition = UIDefinition(nibNamed: name, bundle: nil) else {
            return nil
        }
        
        self.delegate = delegate
        self.mainUi = uiDefinition
        
        // Test application
        guard let ui = mainUi else {
            return nil
        }
        
        // Laund main nib file
        if !ui.instantiate(owner: self, objects: [delegate]) {
            return nil
        }
    }
    
    
    public func run() {
        
        guard !running else {
            return 
        }
        
        // Set running
        running = true
        
        // Application did finish launching
        if delegate != nil {
            delegate!.applicationDidFinishLaunching(Notification(name: Notification.Name.init(rawValue: "NSApplicationDidFinishLaunching")))
        }
        
        // Launch GTK main loop
        gtk_main ()
        
        // Application will terminate
        if delegate != nil {
            delegate!.applicationWillTerminate(Notification(name: Notification.Name.init(rawValue: "NSApplicationWillTerminate")))
        }
    }
    
    /// Terminate application
    public func terminate(_ sender: Any?) {
        
        if (!running) {
            return
        }
        
        // Set running
        running = false
        
        gtk_main_quit()
    }
}

public protocol ApplicationDelegate : NSObjectProtocol {
    func applicationDidFinishLaunching(_ aNotification: Notification)
    func applicationWillTerminate(_ aNotification: Notification)
}

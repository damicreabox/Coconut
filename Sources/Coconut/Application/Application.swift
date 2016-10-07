//
//  Application.swift
//  Coconut
//
//  Created by Dami on 06/10/2016.
//
//

import Foundation

import CGtk

public class Application {
    
    /// Gtk application
    internal let app : UnsafeMutablePointer<GtkApplication>
    
    var mainNib : Nib
    var delegate : ApplicationDelegate
    
    static var app : Application? = nil
    
    class func shared() -> NSApplication {
        return app!
    }
    
    init?(delegate: ApplicationDelegate, andNibName name: String) {
        
        
        // Open nib
        guard let nib = Nib(nibNamed: name, bundle: nil) else {
            return nil
        }
        
        self.delegate = delegate
        self.mainNib = nib
        
        // Init GTK library
        gtk_init(nil, nil)
        
        // Create application
        app = gtk_application_new ("org.gtk.example", G_APPLICATION_FLAGS_NONE)
        
        // Laund main nib file
        guard mainNib.instantiate(withOwner: delegate, topLevelObjects: nil) else {
            // FIXME add log
            return
        }
        
        Application.app = self
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

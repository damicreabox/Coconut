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
    
    var mainNib : Nib
    var delegate : ApplicationDelegate
    
    init?(delegate: ApplicationDelegate, andNibName name: String) {
        
        // Open nib
        guard let nib = Nib(nibNamed: name, bundle: nil) else {
            return nil
        }
        
        self.delegate = delegate
        self.mainNib = nib
    }
    
    public func run() {
        
        // Init GTK library
        gtk_init(nil, nil)
        
        // Laund main nib file
        guard mainNib.instantiate(withOwner: delegate, topLevelObjects: nil) else {
            // FIXME add log
            return
        }
        
        // Application did finish launching
        delegate.applicationDidFinishLaunching(Notification(name: Notification.Name.init(rawValue: "NSApplicationDidFinishLaunching")))
        
        // Launch GTK main loop
        gtk_main ()
        
        // Application will terminate
        delegate.applicationWillTerminate(Notification(name: Notification.Name.init(rawValue: "NSApplicationWillTerminate")))
    }
}

public protocol ApplicationDelegate : NSObjectProtocol {
    func applicationDidFinishLaunching(_ aNotification: Notification)
    func applicationWillTerminate(_ aNotification: Notification)
}

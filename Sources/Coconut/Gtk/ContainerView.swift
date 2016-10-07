//
//  ContainerView.swift
//  Coconut
//
//  Created by Dami on 07/10/2016.
//
//

import Foundation
import CGtk

class ContainerView : View {
    
    init() {
        super.init(widget: nil)
    }
    
    override internal func redraw(widget parent: UnsafeMutablePointer<GtkWidget>) {
        
        /* Here we construct the container that is going pack our buttons */
        self.widget = gtk_grid_new ()
        
        /* Pack the container in the window */
        gtk_container_add (toContainer(widget: parent), self.widget)

        // Add view
        gtk_container_add(toContainer(widget: widget), self.widget)
        
        // Parse views
        var index : Int32 = 0
        for view in self.views {
            
            if let subWidget = view.widget {
                
                // Redraw
                view.redraw(widget: subWidget)
         
                // Atache element
                gtk_grid_attach (toGrid(widget: self.widget), view.widget, 1, index, 2, 1)
                
                // Add index
                index = index + 1
            }
        }
    }
}

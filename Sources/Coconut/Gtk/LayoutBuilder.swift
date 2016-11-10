//
//  LayoutBuilder.swift
//  Sample-coconut
//
//  Created by Dami on 10/11/2016.
//
//

import Foundation

import CGtk

public class LayoutBuilder {
    
    public var container: View? = nil
    private var views = [View]()
    private var constraints = [LayoutConstraint]()
    
    public func add(views: [View]) {
        for view in views {
            self.views.append(view)
        }
    }
    
    public func add(constraints: [LayoutConstraint]) {
        for constraint in constraints {
            self.constraints.append(constraint)
        }
    }
    
    private func createFixedLayout(container: View) -> UnsafeMutablePointer<GtkWidget>? {
        
        // Create fixed container
        let widget = gtk_fixed_new()
        
        // Aprse views
        for view in self.views {
            
            // Redraw
            if let subWidget = view.redraw(widget: widget!) {
                
                // Covert point
                let origin = convertPoint(point: view.frame.origin, frame: container.frame)
                
                let fixed = toFixed(widget: widget)
                
                // Atache element
                gtk_fixed_put (fixed, subWidget, 0, 0)
                gtk_fixed_move(fixed, subWidget, Int32(origin.x), Int32(origin.y))
                
            }
        }
        
        return widget
    }
    
    private func createConstraintsLayout(container: View) -> UnsafeMutablePointer<GtkWidget>? {
        
        /* Here we construct the container that is going pack our buttons */
        let widget = gtk_grid_new ()
        
        // Parse views
        var index : Int32 = 0
        for view in self.views {
            // Redraw
            if let subWidget = view.redraw(widget: widget!) {
                
                // Atache element
                gtk_grid_attach (toGrid(widget: widget), subWidget, 1, index, 2, 1)
                
            }
            
            // Add index
            index = index + 1
        }
        
        return widget
    }
    
    public func build() -> UnsafeMutablePointer<GtkWidget>? {

        guard let container = container else {
            return nil
        }
        
        // Test constraints
        let constraints = self.constraints
        if (constraints.isEmpty) {
            return createFixedLayout(container: container)
        } else {
            return createConstraintsLayout(container: container)
        }
    }
}

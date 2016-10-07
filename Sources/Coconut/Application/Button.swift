//
//  Button.swift
//  Coconut
//
//  Created by Dami on 07/10/2016.
//
//

import Foundation

import CGtk

func print_hello (_ widget: UnsafeMutablePointer<GtkWidget>?,
                  _ data: UnsafeMutablePointer<gpointer>?)
{
    print ("Hello World\n");
}


class Button : Control {
 
    init(title: String) {
        super.init(widget: gtk_button_new_with_label (title))
        //g_signal_connect_swapped (button, "clicked", G_CALLBACK (gtk_widget_destroy), window);
        connect(source: widget!, signal: "clicked",
                callback: {
                    source, data in
                    print("plop")
            }, destination: toGPointer(widget: widget))
    }
    
    public var title: String {
        get {
            return String(cString: gtk_button_get_label(toButton(widget: widget)))
        }
        set {
            gtk_button_set_label(toButton(widget: widget), title)
        }
    }
}

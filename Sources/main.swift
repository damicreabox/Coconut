import Foundation
import CGtk

/*
func print_hello() {
    
}

gtk_init(nil, nil)

var window = gtk_window_new (GTK_WINDOW_TOPLEVEL)

gtk_window_set_title (toWindow (widget: window), "Hello World")
gtk_window_set_default_size (toWindow (widget: window), 200, 200)

var button_box = gtk_button_box_new (GTK_ORIENTATION_HORIZONTAL)
gtk_container_add (toContainer (widget: window), button_box)

var button = gtk_button_new_with_label ("Hello World")
g_signal_connect_data (button, "clicked", print_hello, nil, nil, GConnectFlags.init(0))

gtk_container_add (toContainer(widget: button_box), button)

gtk_widget_show (window)

gtk_main ()
 
 */

func print_hello() {
    print("Hello")
}

gtk_init (nil, nil)

var builder = gtk_builder_new ()
gtk_builder_add_from_file (builder, "Sources/builder.ui", nil)

var window = gtk_builder_get_object (builder, "window")
connectSignal (object: window, signal: "destroy", callback: gtk_main_quit)

var button = gtk_builder_get_object (builder, "button1")
connectSignal (object: button, signal: "clicked", callback: print_hello)

button = gtk_builder_get_object (builder, "button2")
connectSignal (object: button, signal: "clicked", callback: print_hello)

button = gtk_builder_get_object (builder, "quit")
connectSignal (object: button, signal: "clicked", callback: gtk_main_quit)

gtk_main ()


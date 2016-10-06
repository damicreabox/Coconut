import Foundation
import CGtk


// Create application
guard let application = Application(delegate: SimpleApplicationDelegate(), andNibName: "mainNib") else {
    exit(1)
}

// Launch application
application.run()


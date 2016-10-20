import Foundation
import CGtk


UIFactoryManager.instance.register(name: "mainNib") {MainNibSample()}
// Create application
guard let application = Application(delegate: SimpleApplicationDelegate(), uiName: "mainNib") else {
    exit(1)
}

// Launch application
application.run()


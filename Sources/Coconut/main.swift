import Foundation
import CGtk


UIFactoryManager.instance.register(name: "mainNib", factory: MainNibSample())
// Create application
guard let application = Application(delegate: SimpleApplicationDelegate(), uiName: "mainNib") else {
    exit(1)
}

// Launch application
application.run()


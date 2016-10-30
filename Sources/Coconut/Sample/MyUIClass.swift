import Foundation
public class MyUIClass : UIDefinitionDelegate {
    private let application: Application
    private let firstResponder: Responder
    private var owner: NSObject? = nil
    private let window0: Window
    private let view0: View
    static func createView0() -> View {
        return View()
    }
    init() {
        self.application = Application.shared()
        self.firstResponder = application
        let windowFrame0 = NSRect(origin: NSPoint(x: 283.0,y: 207.0), size: NSSize(width: 480.0, height: 270.0))
        self.window0 = Window(contentRect: windowFrame0)
        self.window0.title = "Window"
        self.view0 = MyUIClass.createView0()
    }
    public func instantiate(owner: Any?, objects: [NSObjectProtocol]?) -> Bool {
        if let object = objects?[0] as? NSObject { 
            self.owner = object
        } else {
            NSLog("\"File's Owner\" not an \"NSObject\"")
        }
        window0.makeKeyAndOrderFront(window0)
        return true
    }
}

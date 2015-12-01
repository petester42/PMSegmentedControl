#if os(iOS) || os(watchOS) || os(tvOS)
    import UIKit
    public typealias ViewType = UIView
    public typealias GestureRecognizerType = UITapGestureRecognizer
    public typealias ControlType = UIControl
#elseif os(OSX)
    import AppKit
    public typealias ViewType = NSView
    public typealias GestureRecognizerType = NSClickGestureRecognizer
    public typealias ControlType = NSControl
#endif

public typealias View = ViewType
public typealias GestureRecognizer = GestureRecognizerType
public typealias Control = ControlType

extension ViewType {
    
    #if os(iOS) || os(watchOS) || os(tvOS)

    public var wantsLayer: Bool {
        set {
            // Do nothing
        }
        
        get {
            return true
        }
    }
    
    #elseif os(OSX)

    public func layoutSubviews() {
        layout()
    }

    public class func animateWithDuration(duration: NSTimeInterval, animations: () -> Void) {
        
        let changes: (NSAnimationContext) -> Void = { context in
            context.duration = duration
            context.allowsImplicitAnimation = true
            animations()
        }
        
        NSAnimationContext.runAnimationGroup(changes, completionHandler: nil)
    }
    
    #endif
}
#if os(iOS) || os(watchOS) || os(tvOS)
    import UIKit
    public typealias ColorType = UIColor
    public typealias WindowType = UIWindow
#elseif os(OSX)
    import AppKit
    public typealias ColorType = NSColor
    public typealias WindowType = NSWindow
#endif

public typealias Color = ColorType
public typealias Window = WindowType

extension ViewType {
    
    #if os(iOS) || os(watchOS) || os(tvOS)
    
    #elseif os(OSX)
    
    public var backgroundColor: Color {
        set (color) {
            layer?.backgroundColor = color.CGColor
        }
        
        get {
            guard let layer = layer, let backgroundColor = layer.backgroundColor, let color = Color(CGColor: backgroundColor) else {
                return Color.clearColor()
            }
                        
            return color
        }
    }
    
    #endif
}

extension WindowType {
    
    #if os(iOS) || os(watchOS) || os(tvOS)
    
    #elseif os(OSX)
    
    convenience init(frame: CGRect) {
        self.init()
    }
    
    #endif
}

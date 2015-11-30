import UIKit

internal final class SegmentItem {
    
    internal let view: UIView
    internal let index: Int
    internal let tapGesture = UITapGestureRecognizer()
    
    internal var selectionAction: (Int -> Void)
    
    internal init(_ _view: UIView, atIndex _index: Int, selection: (Int -> Void)) {
        
        view = _view
        view.addGestureRecognizer(tapGesture)
        
        index = _index
        
        selectionAction = selection
        
        tapGesture.addTarget(self, action: "tap:")
    }
    
    deinit {
        tapGesture.removeTarget(nil, action: nil)
        view.removeGestureRecognizer(tapGesture)
    }
    
    dynamic func tap(gesture: UITapGestureRecognizer) {
        selectionAction(index)
    }
}

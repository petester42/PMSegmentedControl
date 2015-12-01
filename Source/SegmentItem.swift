import UIKit

internal final class SegmentItem {
    
    internal let view: UIView
    internal let index: Int
    internal lazy var tapGesture: UITapGestureRecognizer = {
        return UITapGestureRecognizer(target: self, action: "tap:")
    }()
    
    internal var selectionAction: (Int -> Void)
    
    internal init(_ _view: UIView, atIndex _index: Int, selection: (Int -> Void)) {
        
        view = _view
        index = _index
        selectionAction = selection

        view.addGestureRecognizer(tapGesture)
    }
    
    deinit {
        view.removeGestureRecognizer(tapGesture)
    }
    
    dynamic func tap(gesture: UITapGestureRecognizer) {
        selectionAction(index)
    }
}

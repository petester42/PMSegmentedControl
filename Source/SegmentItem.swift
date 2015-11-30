internal final class SegmentItem {
    
    internal let view: ViewType
    internal let index: Int
    internal lazy var tapGesture: GestureRecognizerType = {
        return GestureRecognizer(target: self, action: "tap:")
    }()
    
    internal var selectionAction: (Int -> Void)
    
    internal init(_ _view: ViewType, atIndex _index: Int, selection: (Int -> Void)) {
        
        view = _view
        index = _index
        selectionAction = selection

        view.addGestureRecognizer(tapGesture)
    }
    
    deinit {
        view.removeGestureRecognizer(tapGesture)
    }
    
    dynamic func tap(gesture: GestureRecognizerType) {
        selectionAction(index)
    }
}

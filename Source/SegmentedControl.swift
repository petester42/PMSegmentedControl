import UIKit
import Cartography

@IBDesignable
public final class SegmentedControl: UIControl {

    private let group = ConstraintGroup()

    internal var segments = [SegmentItem]()

    public var didSelectItem: (UIView -> Void)?
    public var didDeselectItem: (UIView -> Void)?

    public var selectedSegmentIndex = -1 {

        willSet {

            guard selectedSegmentIndex != newValue, let segment = segmentAtIndex(selectedSegmentIndex) else {
                return
            }

            didDeselectItem?(segment.view)
        }

        didSet {

            guard let segment = segmentAtIndex(selectedSegmentIndex) else {
                return
            }

            sendActionsForControlEvents(.ValueChanged)

            didSelectItem?(segment.view)
        }
    }

    @IBInspectable
    public var offset: CGFloat = 0.0 {
        didSet {
            updateItems(false)
        }
    }

    public init(items: [UIView]) {
        super.init(frame: CGRectZero)

        for var i = 0; i < items.count; ++i {
            insertSegment(items[i], atIndex: i, animated: false)
        }

        updateItems(false)
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)

        updateItems(false)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        updateItems(false)
    }

    public var items: [UIView] {
        return segments.map { $0.view }
    }

    public var numberOfSegments: Int {
        return segments.count
    }

    public func insertSegment(view: UIView, atIndex segment: Int, animated: Bool) {

        removeItemAtIndex(segment)
        addItem(view, atIndex: segment)

        updateItems(animated)
    }

    public func removeSegment(atIndex segment: Int, animated: Bool) {

        removeItemAtIndex(segment)

        updateItems(animated)
    }

    public func removeAllSegments() {

        while numberOfSegments != 0 {
            removeItemAtIndex(0)
        }

        updateItems(false)
    }

    // MARK: Private Methods

    private func segmentAtIndex(index: Int) -> SegmentItem? {

        guard segments.indices.contains(index) else {
            return nil
        }

        return segments[index]
    }

    private func updateItems(animated: Bool) {

    constrain(segments.map { $0.view }, replace: group) { views in

          var previous: LayoutProxy?

          for var i = 0; i < views.count; ++i {

              let view = views[i]

              view.top == view.superview!.top
              view.bottom == view.superview!.bottom
              view.width <= (view.superview!.width - (offset * CGFloat(views.count - 1))) / CGFloat(views.count)

              if let previous = previous {
                  previous.trailing == view.leading - offset
              } else {
                  view.leading == view.superview!.leading
              }

              previous = view

              if i == views.count - 1 {
                  view.trailing == view.superview!.trailing
              }
          }
      }

      if animated {
          UIView.animateWithDuration(0.4, animations: setNeedsLayout)
      } else {
          setNeedsLayout()
      }
    }

    private func removeItemAtIndex(index: Int) {

        if let segment = segmentAtIndex(index) {
            segment.view.removeFromSuperview()
            segments.removeAtIndex(index)
        }
    }

    private func addItem(item: UIView, atIndex index: Int) {

        if index >= numberOfSegments {
            segments.append(SegmentItem(item, atIndex: numberOfSegments, selection: selection))
        } else {
            segments.insert(SegmentItem(item, atIndex: index, selection: selection), atIndex: index)
        }

        addSubview(item)
    }

    private func selection(index: Int) -> Void {
        selectedSegmentIndex = index
    }

    // TODO: add other segmented control methods
    //    public var momentary: Bool // if set, then we don't keep showing selected state after tracking ends. default is NO

    // For segments whose width value is 0, setting this property to YES attempts to adjust segment widths based on their content widths. Default is NO.
    //    public var apportionsSegmentWidthsByContent: Bool


    //    public func setWidth(width: CGFloat, forSegmentAtIndex segment: Int) // set to 0.0 width to autosize. default is 0.0
    //    public func widthForSegmentAtIndex(segment: Int) -> CGFloat

    //    public func setContentOffset(offset: CGSize, forSegmentAtIndex segment: Int) // adjust offset of image or text inside the segment. default is (0,0)
    //    public func contentOffsetForSegmentAtIndex(segment: Int) -> CGSize

    //    public func setEnabled(enabled: Bool, forSegmentAtIndex segment: Int) // default is YES
    //    public func isEnabledForSegmentAtIndex(segment: Int) -> Bool

    // ignored in momentary mode. returns last segment pressed. default is UISegmentedControlNoSegment until a segment is pressed
    // the UIControlEventValueChanged action is invoked when the segment changes via a user event. set to UISegmentedControlNoSegment to turn off selection

    // The tintColor is inherited through the superview hierarchy. See UIView for more information.
    //    public var tintColor: UIColor!
}

import Quick
import Nimble
@testable import PMSegmentedControl

extension Array {
    func atIndex(index: Int) -> Element? {
        if index >= self.count || index < 0 {
            return nil
        } else {
            return self[index]
        }
    }
}

class SegmentedControlSpec: QuickSpec {
    
    override func spec() {
        
        describe("segment control layout") {
            
            var window: WindowType!
            var segmentControl: SegmentedControl!
            
            beforeEach {
                
                window = Window(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
                segmentControl = SegmentedControl(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
                
                window.addSubview(segmentControl)
            }
            
            it("will contain the right amount of segments") {
                
                segmentControl.insertSegment(View(), atIndex: 0, animated: false)
                segmentControl.insertSegment(View(), atIndex: 1, animated: false)
                segmentControl.insertSegment(View(), atIndex: 2, animated: false)
                
                expect(segmentControl.items.count) == 3
                
                segmentControl.removeSegment(atIndex: 0, animated: false)
                
                expect(segmentControl.items.count) == 2
                
                segmentControl.removeAllSegments()
                
                expect(segmentControl.items.count) == 0
            }
            
            it("will layout an item properly") {
                
                let view1 = View()
                view1.backgroundColor = Color.redColor()
                
                segmentControl.insertSegment(view1, atIndex: 0, animated: false)
                
                expect(segmentControl.segments.atIndex(0)?.view.frame) == CGRect(x: 0, y: 0, width: 300, height: 50)
                expect(segmentControl.segments.atIndex(0)?.view.backgroundColor) == Color.redColor()
            }
            
            it("will layout multiple items properly") {
                
                let view1 = View()
                view1.backgroundColor = Color.redColor()
                
                let view2 = View()
                view2.backgroundColor = Color.greenColor()
                
                let view3 = View()
                view3.backgroundColor = Color.blueColor()
                
                segmentControl.insertSegment(view1, atIndex: 0, animated: false)
                segmentControl.insertSegment(view2, atIndex: 1, animated: false)
                segmentControl.insertSegment(view3, atIndex: 2, animated: false)
                
                expect(segmentControl.segments.atIndex(0)?.view.frame) == CGRect(x: 0, y: 0, width: 100, height: 50)
                expect(segmentControl.segments.atIndex(0)?.view.backgroundColor) == Color.redColor()
                
                expect(segmentControl.segments.atIndex(1)?.view.frame) == CGRect(x: 100, y: 0, width: 100, height: 50)
                expect(segmentControl.segments.atIndex(1)?.view.backgroundColor) == Color.greenColor()
                
                expect(segmentControl.segments.atIndex(2)?.view.frame) == CGRect(x: 200, y: 0, width: 100, height: 50)
                expect(segmentControl.segments.atIndex(2)?.view.backgroundColor) == Color.blueColor()
            }
            
            it("will insert an item at index property") {
                
                let view1 = View()
                view1.backgroundColor = Color.redColor()
                
                let view2 = View()
                view2.backgroundColor = Color.greenColor()
                
                let view3 = View()
                view3.backgroundColor = Color.blueColor()
                
                segmentControl.insertSegment(view1, atIndex: 0, animated: false)
                segmentControl.insertSegment(view2, atIndex: 1, animated: false)
                
                expect(segmentControl.segments.atIndex(0)?.view.frame) == CGRect(x: 0, y: 0, width: 150, height: 50)
                expect(segmentControl.segments.atIndex(0)?.view.backgroundColor) == Color.redColor()
                
                expect(segmentControl.segments.atIndex(1)?.view.frame) == CGRect(x: 150, y: 0, width: 150, height: 50)
                expect(segmentControl.segments.atIndex(1)?.view.backgroundColor) == Color.greenColor()
                
                segmentControl.insertSegment(view3, atIndex: 2, animated: false)
                
                expect(segmentControl.segments.atIndex(0)?.view.frame) == CGRect(x: 0, y: 0, width: 100, height: 50)
                expect(segmentControl.segments.atIndex(0)?.view.backgroundColor) == Color.redColor()
                
                expect(segmentControl.segments.atIndex(1)?.view.frame) == CGRect(x: 100, y: 0, width: 100, height: 50)
                expect(segmentControl.segments.atIndex(1)?.view.backgroundColor) == Color.greenColor()
                
                expect(segmentControl.segments.atIndex(2)?.view.frame) == CGRect(x: 200, y: 0, width: 100, height: 50)
                expect(segmentControl.segments.atIndex(2)?.view.backgroundColor) == Color.blueColor()
            }
            
            it("will insert an item at index property when no segment exists") {
                
                let view1 = View()
                view1.backgroundColor = Color.redColor()
                
                segmentControl.insertSegment(view1, atIndex: 0, animated: false)
                
                expect(segmentControl.segments.atIndex(0)?.view.frame) == CGRect(x: 0, y: 0, width: 300, height: 50)
                expect(segmentControl.segments.atIndex(0)?.view.backgroundColor) == Color.redColor()
            }
            
            it("will remove an item at index property") {
                
                let view1 = View()
                view1.backgroundColor = Color.redColor()
                
                let view2 = View()
                view2.backgroundColor = Color.greenColor()
                
                let view3 = View()
                view3.backgroundColor = Color.blueColor()
                
                segmentControl.insertSegment(view1, atIndex: 0, animated: false)
                segmentControl.insertSegment(view2, atIndex: 1, animated: false)
                segmentControl.insertSegment(view3, atIndex: 2, animated: false)
                
                expect(segmentControl.segments.atIndex(0)?.view.frame) == CGRect(x: 0, y: 0, width: 100, height: 50)
                expect(segmentControl.segments.atIndex(0)?.view.backgroundColor) == Color.redColor()
                
                expect(segmentControl.segments.atIndex(1)?.view.frame) == CGRect(x: 100, y: 0, width: 100, height: 50)
                expect(segmentControl.segments.atIndex(1)?.view.backgroundColor) == Color.greenColor()
                
                expect(segmentControl.segments.atIndex(2)?.view.frame) == CGRect(x: 200, y: 0, width: 100, height: 50)
                expect(segmentControl.segments.atIndex(2)?.view.backgroundColor) == Color.blueColor()
                
                segmentControl.removeSegment(atIndex: 1, animated: false)
                
                expect(segmentControl.segments.atIndex(0)?.view.frame) == CGRect(x: 0, y: 0, width: 150, height: 50)
                expect(segmentControl.segments.atIndex(0)?.view.backgroundColor) == Color.redColor()
                
                expect(segmentControl.segments.atIndex(1)?.view.frame) == CGRect(x: 150, y: 0, width: 150, height: 50)
                expect(segmentControl.segments.atIndex(1)?.view.backgroundColor) == Color.blueColor()
            }
            
            it("will remove an item at index properly when only one exists") {
                
                let view1 = View()
                view1.backgroundColor = Color.redColor()
                
                segmentControl.insertSegment(view1, atIndex: 0, animated: false)
                
                expect(segmentControl.segments.atIndex(0)?.view.frame) == CGRect(x: 0, y: 0, width: 300, height: 50)
                expect(segmentControl.segments.atIndex(0)?.view.backgroundColor) == Color.redColor()
                
                segmentControl.removeSegment(atIndex: 0, animated: false)
                
                expect(segmentControl.segments.atIndex(0)).to(beNil())
            }
            
            it("will replace an item at index property") {
                
                let view1 = View()
                view1.backgroundColor = Color.redColor()
                
                let view2 = View()
                view2.backgroundColor = Color.greenColor()
                
                let view3 = View()
                view3.backgroundColor = Color.blueColor()
                
                let view4 = View()
                view4.backgroundColor = Color.orangeColor()
                
                segmentControl.insertSegment(view1, atIndex: 0, animated: false)
                segmentControl.insertSegment(view2, atIndex: 1, animated: false)
                segmentControl.insertSegment(view3, atIndex: 2, animated: false)
                
                expect(segmentControl.segments.atIndex(0)?.view.frame) == CGRect(x: 0, y: 0, width: 100, height: 50)
                expect(segmentControl.segments.atIndex(0)?.view.backgroundColor) == Color.redColor()
                
                expect(segmentControl.segments.atIndex(1)?.view.frame) == CGRect(x: 100, y: 0, width: 100, height: 50)
                expect(segmentControl.segments.atIndex(1)?.view.backgroundColor) == Color.greenColor()
                
                expect(segmentControl.segments.atIndex(2)?.view.frame) == CGRect(x: 200, y: 0, width: 100, height: 50)
                expect(segmentControl.segments.atIndex(2)?.view.backgroundColor) == Color.blueColor()
                
                segmentControl.insertSegment(view4, atIndex: 1, animated: false)
                
                expect(segmentControl.segments.atIndex(0)?.view.frame) == CGRect(x: 0, y: 0, width: 100, height: 50)
                expect(segmentControl.segments.atIndex(0)?.view.backgroundColor) == Color.redColor()
                
                expect(segmentControl.segments.atIndex(1)?.view.frame) == CGRect(x: 100, y: 0, width: 100, height: 50)
                expect(segmentControl.segments.atIndex(1)?.view.backgroundColor) == Color.orangeColor()
                
                expect(segmentControl.segments.atIndex(2)?.view.frame) == CGRect(x: 200, y: 0, width: 100, height: 50)
                expect(segmentControl.segments.atIndex(2)?.view.backgroundColor) == Color.blueColor()
            }
            
            it("will replace an item at index properly when only one segment exists") {
                
                let view1 = View()
                view1.backgroundColor = Color.redColor()
                
                let view2 = View()
                view2.backgroundColor = Color.greenColor()
                
                segmentControl.insertSegment(view1, atIndex: 0, animated: false)
                
                expect(segmentControl.segments.atIndex(0)?.view.frame) == CGRect(x: 0, y: 0, width: 300, height: 50)
                expect(segmentControl.segments.atIndex(0)?.view.backgroundColor) == Color.redColor()
                
                segmentControl.insertSegment(view2, atIndex: 0, animated: false)
                
                expect(segmentControl.segments.atIndex(0)?.view.frame) == CGRect(x: 0, y: 0, width: 300, height: 50)
                expect(segmentControl.segments.atIndex(0)?.view.backgroundColor) == Color.greenColor()
            }
            
            it("will remove an item and then insert an item") {
                
                let view1 = View()
                view1.backgroundColor = Color.redColor()
                
                let view2 = View()
                view2.backgroundColor = Color.greenColor()
                
                segmentControl.insertSegment(view1, atIndex: 0, animated: false)
                
                expect(segmentControl.segments.atIndex(0)?.view.frame) == CGRect(x: 0, y: 0, width: 300, height: 50)
                expect(segmentControl.segments.atIndex(0)?.view.backgroundColor) == Color.redColor()
                
                segmentControl.removeSegment(atIndex: 0, animated: false)
                segmentControl.insertSegment(view2, atIndex: 0, animated: false)
                
                expect(segmentControl.segments.atIndex(0)?.view.frame) == CGRect(x: 0, y: 0, width: 300, height: 50)
                expect(segmentControl.segments.atIndex(0)?.view.backgroundColor) == Color.greenColor()
            }
            
            it("will push item if index is out of bounds") {
                
                let view1 = View()
                view1.backgroundColor = Color.redColor()
                
                segmentControl.insertSegment(view1, atIndex: 1, animated: false)
                
                expect(segmentControl.segments.atIndex(0)?.view.frame) == CGRect(x: 0, y: 0, width: 300, height: 50)
                expect(segmentControl.segments.atIndex(0)?.view.backgroundColor) == Color.redColor()
            }
            
            it("will animate layout") {
                
                let view1 = View()
                view1.backgroundColor = Color.redColor()
                
                segmentControl.insertSegment(view1, atIndex: 0, animated: true)
                
                expect(segmentControl.segments.atIndex(0)?.view.frame) == CGRect(x: 0, y: 0, width: 300, height: 50)
                expect(segmentControl.segments.atIndex(0)?.view.backgroundColor) == Color.redColor()
            }
            
            it("will layout properly with an offset") {
                
                let view1 = View()
                view1.backgroundColor = Color.redColor()
                
                let view2 = View()
                view2.backgroundColor = Color.greenColor()
                
                let view3 = View()
                view3.backgroundColor = Color.blueColor()
                
                segmentControl.offset = 30
                
                segmentControl.insertSegment(view1, atIndex: 0, animated: false)
                segmentControl.insertSegment(view2, atIndex: 1, animated: false)
                segmentControl.insertSegment(view3, atIndex: 2, animated: false)
                
                expect(segmentControl.segments.atIndex(0)?.view.frame) == CGRect(x: 0, y: 0, width: 80, height: 50)
                expect(segmentControl.segments.atIndex(0)?.view.backgroundColor) == Color.redColor()
                
                expect(segmentControl.segments.atIndex(1)?.view.frame) == CGRect(x: 110, y: 0, width: 80, height: 50)
                expect(segmentControl.segments.atIndex(1)?.view.backgroundColor) == Color.greenColor()
                
                expect(segmentControl.segments.atIndex(2)?.view.frame) == CGRect(x: 220, y: 0, width: 80, height: 50)
                expect(segmentControl.segments.atIndex(2)?.view.backgroundColor) == Color.blueColor()
            }
        }
        
        describe("segment control initializers") {
            
            var window: WindowType!
            
            beforeEach {
                window = Window(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
            }
            
            it("will initialized with views properly") {
                
                let view1 = View()
                view1.backgroundColor = Color.redColor()
                
                let view2 = View()
                view2.backgroundColor = Color.greenColor()
                
                let view3 = View()
                view3.backgroundColor = Color.blueColor()
                
                let segmentControl = SegmentedControl(items: [view1, view2, view3])
                segmentControl.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
                
                window.addSubview(segmentControl)
                
                segmentControl.layoutSubviews()
                
                expect(segmentControl.segments.atIndex(0)?.view.frame) == CGRect(x: 0, y: 0, width: 100, height: 50)
                expect(segmentControl.segments.atIndex(0)?.view.backgroundColor) == Color.redColor()
                
                expect(segmentControl.segments.atIndex(1)?.view.frame) == CGRect(x: 100, y: 0, width: 100, height: 50)
                expect(segmentControl.segments.atIndex(1)?.view.backgroundColor) == Color.greenColor()
                
                expect(segmentControl.segments.atIndex(2)?.view.frame) == CGRect(x: 200, y: 0, width: 100, height: 50)
                expect(segmentControl.segments.atIndex(2)?.view.backgroundColor) == Color.blueColor()
            }
            
            it("will initialized with views properly") {
                
                let coder = MockCoder()
                let segmentControl = SegmentedControl(coder: coder)
                
                expect(segmentControl).toNot(beNil())
            }
        }
        
        describe("segment control selection") {
            
            var window: WindowType!
            var view: MockSegmentView!
            
            beforeEach {
                window = Window(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
                view = MockSegmentView()
                window.addSubview(view)
                view.segmentControl.layoutSubviews()
            }
            
            it("should select an segment") {
                
                let segment1 = view.segmentControl.segments[1]
                segment1.tap(segment1.tapGesture)
                
                let segment0 = view.segmentControl.segments[0]
                segment0.tap(segment0.tapGesture)
                
                expect(view.selections) == [1, 0]
            }
            
            it("should highlight the selected segment") {
                
                expect(view.segmentControl.segments.atIndex(0)?.view.frame) == CGRect(x: 0, y: 0, width: 100, height: 50)
                expect(view.segmentControl.segments.atIndex(0)?.view.backgroundColor) == Color.blueColor()
                
                expect(view.segmentControl.segments.atIndex(1)?.view.frame) == CGRect(x: 100, y: 0, width: 100, height: 50)
                expect(view.segmentControl.segments.atIndex(1)?.view.backgroundColor) == Color.blueColor()
                
                expect(view.segmentControl.segments.atIndex(2)?.view.frame) == CGRect(x: 200, y: 0, width: 100, height: 50)
                expect(view.segmentControl.segments.atIndex(2)?.view.backgroundColor) == Color.blueColor()
                
                let segment1 = view.segmentControl.segments[1]
                segment1.tap(segment1.tapGesture)
                
                expect(view.segmentControl.segments.atIndex(0)?.view.frame) == CGRect(x: 0, y: 0, width: 100, height: 50)
                expect(view.segmentControl.segments.atIndex(0)?.view.backgroundColor) == Color.blueColor()
                
                expect(view.segmentControl.segments.atIndex(1)?.view.frame) == CGRect(x: 100, y: 0, width: 100, height: 50)
                expect(view.segmentControl.segments.atIndex(1)?.view.backgroundColor) == Color.redColor()
                
                expect(view.segmentControl.segments.atIndex(2)?.view.frame) == CGRect(x: 200, y: 0, width: 100, height: 50)
                expect(view.segmentControl.segments.atIndex(2)?.view.backgroundColor) == Color.blueColor()
                
                let segment2 = view.segmentControl.segments[2]
                segment2.tap(segment2.tapGesture)
                
                expect(view.segmentControl.segments.atIndex(0)?.view.frame) == CGRect(x: 0, y: 0, width: 100, height: 50)
                expect(view.segmentControl.segments.atIndex(0)?.view.backgroundColor) == Color.blueColor()
                
                expect(view.segmentControl.segments.atIndex(1)?.view.frame) == CGRect(x: 100, y: 0, width: 100, height: 50)
                expect(view.segmentControl.segments.atIndex(1)?.view.backgroundColor) == Color.blueColor()
                
                expect(view.segmentControl.segments.atIndex(2)?.view.frame) == CGRect(x: 200, y: 0, width: 100, height: 50)
                expect(view.segmentControl.segments.atIndex(2)?.view.backgroundColor) == Color.redColor()
            }
            
            it("should not select an element when it does not exist") {
                
                view.segmentControl.selectedSegmentIndex = 3
                
                expect(view.selections) == []
            }
        }
    }
}

public class MockSegmentView: View {
    
    public var segmentControl: SegmentedControl!
    public var selections = [Int]()
    
    public init() {
        super.init(frame: CGRectMake(0, 0, 300, 50))
        
        let view1 = View()
        view1.backgroundColor = Color.blueColor()
        
        let view2 = View()
        view2.backgroundColor = Color.blueColor()
        
        let view3 = View()
        view3.backgroundColor = Color.blueColor()
        
        segmentControl = SegmentedControl(frame: bounds)
        addSubview(segmentControl)
        
        segmentControl.insertSegment(view1, atIndex: 0, animated: false)
        segmentControl.insertSegment(view2, atIndex: 1, animated: false)
        segmentControl.insertSegment(view3, atIndex: 2, animated: false)
        
        segmentControl.didSelectItem = { [weak self] item in
            item.backgroundColor = Color.redColor()
            
            guard let strongSelf = self else {
                return
            }
            
            strongSelf.didSelect(strongSelf.segmentControl)
        }
        
        segmentControl.didDeselectItem = { item in
            item.backgroundColor = Color.blueColor()
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func didSelect(sender: SegmentedControl) {
        selections.append(sender.selectedSegmentIndex)
    }
}

public class MockCoder: NSCoder {
    
    public override init() {
        super.init()
    }
    
    public override var allowsKeyedCoding: Bool {
        return true
    }
    
    public override func containsValueForKey(key: String) -> Bool {
        return true
    }
    
    public override func decodeObjectForKey(key: String) -> AnyObject? {
        return nil
    }
    
    public override func decodeBoolForKey(key: String) -> Bool {
        return false
    }
    
    public override func decodeIntForKey(key: String) -> Int32 {
        return 0
    }
    
    public override func decodeInt32ForKey(key: String) -> Int32 {
        return 0
    }
    
    public override func decodeInt64ForKey(key: String) -> Int64 {
        return 0
    }
    
    public override func decodeFloatForKey(key: String) -> Float {
        return 0.0
    }
    
    public override func decodeDoubleForKey(key: String) -> Double {
        return 0.0
    }
}

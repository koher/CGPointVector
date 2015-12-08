import XCTest
import CGPointVector

class CGAffineTransormTests: XCTestCase {
    let torelance: CGFloat = 1.0e-5;
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMultiply() {
        XCTAssert((CGPoint(x: 1.0, y: -2.0) * 3.0).nearlyEqualTo(CGPoint(x: 3.0, y: -6.0), epsilon: torelance))
        XCTAssert((3.0 * CGPoint(x: 1.0, y: -2.0)).nearlyEqualTo(CGPoint(x: 3.0, y: -6.0), epsilon: torelance))
        
        XCTAssert((CGPoint(x: 1.0, y: 1.0) * CGAffineTransformMakeRotation(CGFloat.pi / 4)).nearlyEqualTo(CGPoint(x: 0.0, y: sqrt(2)), epsilon: torelance))
        XCTAssert((CGAffineTransformMakeTranslation(1.0, -2.0) * CGPoint(x: 1.0, y: 1.0)).nearlyEqualTo(CGPoint(x: 2.0, y: -1.0), epsilon: torelance))
    }
}

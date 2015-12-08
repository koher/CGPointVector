import XCTest
import CGPointVector

class CGRectTests: XCTestCase {
    let torelance: CGFloat = 1.0e-5;
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNearlyEqualTo() {
        XCTAssertFalse(CGRectMake(1.0, 2.0, 3.0, 4.0).nearlyEqualTo(CGRectMake(0.0, 2.0, 3.0, 4.0), epsilon: 1.0))
        XCTAssertTrue(CGRectMake(1.0, 2.0, 3.0, 4.0).nearlyEqualTo(CGRectMake(0.1, 2.0, 3.0, 4.0), epsilon: 1.0))
        XCTAssertTrue(CGRectMake(1.0, 2.0, 3.0, 4.0).nearlyEqualTo(CGRectMake(1.9, 2.0, 3.0, 4.0), epsilon: 1.0))
        XCTAssertFalse(CGRectMake(1.0, 2.0, 3.0, 4.0).nearlyEqualTo(CGRectMake(2.0, 2.0, 3.0, 4.0), epsilon: 1.0))
        
        XCTAssertFalse(CGRectMake(1.0, 2.0, 3.0, 4.0).nearlyEqualTo(CGRectMake(1.0, 1.0, 3.0, 4.0), epsilon: 1.0))
        XCTAssertTrue(CGRectMake(1.0, 2.0, 3.0, 4.0).nearlyEqualTo(CGRectMake(1.0, 1.1, 3.0, 4.0), epsilon: 1.0))
        XCTAssertTrue(CGRectMake(1.0, 2.0, 3.0, 4.0).nearlyEqualTo(CGRectMake(1.0, 2.9, 3.0, 4.0), epsilon: 1.0))
        XCTAssertFalse(CGRectMake(1.0, 2.0, 3.0, 4.0).nearlyEqualTo(CGRectMake(1.0, 3.0, 3.0, 4.0), epsilon: 1.0))
        
        XCTAssertFalse(CGRectMake(1.0, 2.0, 3.0, 4.0).nearlyEqualTo(CGRectMake(1.0, 2.0, 2.0, 4.0), epsilon: 1.0))
        XCTAssertTrue(CGRectMake(1.0, 2.0, 3.0, 4.0).nearlyEqualTo(CGRectMake(1.0, 2.0, 2.1, 4.0), epsilon: 1.0))
        XCTAssertTrue(CGRectMake(1.0, 2.0, 3.0, 4.0).nearlyEqualTo(CGRectMake(1.0, 2.0, 3.9, 4.0), epsilon: 1.0))
        XCTAssertFalse(CGRectMake(1.0, 2.0, 3.0, 4.0).nearlyEqualTo(CGRectMake(1.0, 2.0, 4.0, 4.0), epsilon: 1.0))
        
        XCTAssertFalse(CGRectMake(1.0, 2.0, 3.0, 4.0).nearlyEqualTo(CGRectMake(1.0, 2.0, 3.0, 3.0), epsilon: 1.0))
        XCTAssertTrue(CGRectMake(1.0, 2.0, 3.0, 4.0).nearlyEqualTo(CGRectMake(1.0, 2.0, 3.0, 3.1), epsilon: 1.0))
        XCTAssertTrue(CGRectMake(1.0, 2.0, 3.0, 4.0).nearlyEqualTo(CGRectMake(1.0, 2.0, 3.0, 4.9), epsilon: 1.0))
        XCTAssertFalse(CGRectMake(1.0, 2.0, 3.0, 4.0).nearlyEqualTo(CGRectMake(1.0, 2.0, 3.0, 5.0), epsilon: 1.0))
    }
    
    func testCenter() {
        XCTAssertTrue(CGRectMake(1.0, 2.0, 3.0, 4.0).center
            .nearlyEqualTo(CGPoint(x: 2.5, y: 4.0), epsilon: torelance))
    }
    
    func testDescription() {
        XCTAssertEqual(CGRectMake(1.0, 2.0, 3.0, 4.0).description, "((1.0, 2.0), (3.0, 4.0))")
    }
    
    func testMultiply() {
        print(CGRectMake(1.0, 2.0, 3.0, 4.0) * CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 0, ty: 0))
        XCTAssertTrue((CGRectMake(1.0, 2.0, 3.0, 4.0) * CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 0, ty: 0))
            .nearlyEqualTo(CGRectMake(-6.0, 1.0, 4.0, 3.0), epsilon: torelance))
    }
}

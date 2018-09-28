import XCTest
import CGPointVector

class CGRectTests: XCTestCase {
    let torelance: CGFloat = 1.0e-5;
    
    func testisNearlyEqual() {
        XCTAssertFalse(CGRect(x: 1.0, y: 2.0, width: 3.0, height: 4.0).isNearlyEqual(to: CGRect(x: 0.0, y: 2.0, width: 3.0, height: 4.0), epsilon: 1.0))
        XCTAssertTrue(CGRect(x: 1.0, y: 2.0, width: 3.0, height: 4.0).isNearlyEqual(to: CGRect(x: 0.1, y: 2.0, width: 3.0, height: 4.0), epsilon: 1.0))
        XCTAssertTrue(CGRect(x: 1.0, y: 2.0, width: 3.0, height: 4.0).isNearlyEqual(to: CGRect(x: 1.9, y: 2.0, width: 3.0, height: 4.0), epsilon: 1.0))
        XCTAssertFalse(CGRect(x: 1.0, y: 2.0, width: 3.0, height: 4.0).isNearlyEqual(to: CGRect(x: 2.0, y: 2.0, width: 3.0, height: 4.0), epsilon: 1.0))
        
        XCTAssertFalse(CGRect(x: 1.0, y: 2.0, width: 3.0, height: 4.0).isNearlyEqual(to: CGRect(x: 1.0, y: 1.0, width: 3.0, height: 4.0), epsilon: 1.0))
        XCTAssertTrue(CGRect(x: 1.0, y: 2.0, width: 3.0, height: 4.0).isNearlyEqual(to: CGRect(x: 1.0, y: 1.1, width: 3.0, height: 4.0), epsilon: 1.0))
        XCTAssertTrue(CGRect(x: 1.0, y: 2.0, width: 3.0, height: 4.0).isNearlyEqual(to: CGRect(x: 1.0, y: 2.9, width: 3.0, height: 4.0), epsilon: 1.0))
        XCTAssertFalse(CGRect(x: 1.0, y: 2.0, width: 3.0, height: 4.0).isNearlyEqual(to: CGRect(x: 1.0, y: 3.0, width: 3.0, height: 4.0), epsilon: 1.0))
        
        XCTAssertFalse(CGRect(x: 1.0, y: 2.0, width: 3.0, height: 4.0).isNearlyEqual(to: CGRect(x: 1.0, y: 2.0, width: 2.0, height: 4.0), epsilon: 1.0))
        XCTAssertTrue(CGRect(x: 1.0, y: 2.0, width: 3.0, height: 4.0).isNearlyEqual(to: CGRect(x: 1.0, y: 2.0, width: 2.1, height: 4.0), epsilon: 1.0))
        XCTAssertTrue(CGRect(x: 1.0, y: 2.0, width: 3.0, height: 4.0).isNearlyEqual(to: CGRect(x: 1.0, y: 2.0, width: 3.9, height: 4.0), epsilon: 1.0))
        XCTAssertFalse(CGRect(x: 1.0, y: 2.0, width: 3.0, height: 4.0).isNearlyEqual(to: CGRect(x: 1.0, y: 2.0, width: 4.0, height: 4.0), epsilon: 1.0))
        
        XCTAssertFalse(CGRect(x: 1.0, y: 2.0, width: 3.0, height: 4.0).isNearlyEqual(to: CGRect(x: 1.0, y: 2.0, width: 3.0, height: 3.0), epsilon: 1.0))
        XCTAssertTrue(CGRect(x: 1.0, y: 2.0, width: 3.0, height: 4.0).isNearlyEqual(to: CGRect(x: 1.0, y: 2.0, width: 3.0, height: 3.1), epsilon: 1.0))
        XCTAssertTrue(CGRect(x: 1.0, y: 2.0, width: 3.0, height: 4.0).isNearlyEqual(to: CGRect(x: 1.0, y: 2.0, width: 3.0, height: 4.9), epsilon: 1.0))
        XCTAssertFalse(CGRect(x: 1.0, y: 2.0, width: 3.0, height: 4.0).isNearlyEqual(to: CGRect(x: 1.0, y: 2.0, width: 3.0, height: 5.0), epsilon: 1.0))
    }
    
    func testCenter() {
        XCTAssertTrue(CGRect(x: 1.0, y: 2.0, width: 3.0, height: 4.0).center
            .isNearlyEqual(to: CGPoint(x: 2.5, y: 4.0), epsilon: torelance))
    }
    
    func testDescription() {
        XCTAssertEqual(CGRect(x: 1.0, y: 2.0, width: 3.0, height: 4.0).description, "((1.0, 2.0), (3.0, 4.0))")
    }
    
    func testMatmul() {
        print(CGRect(x: 1.0, y: 2.0, width: 3.0, height: 4.0) * CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 0, ty: 0))
        XCTAssertTrue((CGRect(x: 1.0, y: 2.0, width: 3.0, height: 4.0) * CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 0, ty: 0))
            .isNearlyEqual(to: CGRect(x: -6.0, y: 1.0, width: 4.0, height: 3.0), epsilon: torelance))
    }
    
    static var allTests : [(String, (CGRectTests) -> () throws -> Void)] {
        return [
            ("testisNearlyEqual", testisNearlyEqual),
            ("testCenter", testCenter),
            ("testDescription", testDescription),
            ("testMatmul", testMatmul),
        ]
    }
}

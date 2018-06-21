import XCTest
import CGPointVector

class CGAffineTransormTests: XCTestCase {
    let torelance: CGFloat = 1.0e-5;
    
    func testNearlyEqual() {
        XCTAssertFalse(CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0)
            .nearlyEqual(to: CGAffineTransform(a: 0.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0), epsilon: 1.0))
        XCTAssertTrue(CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0)
            .nearlyEqual(to: CGAffineTransform(a: 0.1, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0), epsilon: 1.0))
        XCTAssertTrue(CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0)
            .nearlyEqual(to: CGAffineTransform(a: 1.9, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0), epsilon: 1.0))
        XCTAssertFalse(CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0)
            .nearlyEqual(to: CGAffineTransform(a: 2.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0), epsilon: 1.0))

        XCTAssertFalse(CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0)
            .nearlyEqual(to: CGAffineTransform(a: 1.0, b: 1.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0), epsilon: 1.0))
        XCTAssertTrue(CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0)
            .nearlyEqual(to: CGAffineTransform(a: 1.0, b: 1.1, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0), epsilon: 1.0))
        XCTAssertTrue(CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0)
            .nearlyEqual(to: CGAffineTransform(a: 1.0, b: 2.9, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0), epsilon: 1.0))
        XCTAssertFalse(CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0)
            .nearlyEqual(to: CGAffineTransform(a: 1.0, b: 3.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0), epsilon: 1.0))
        
        XCTAssertFalse(CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0)
            .nearlyEqual(to: CGAffineTransform(a: 1.0, b: 2.0, c: 2.0, d: 4.0, tx: 5.0, ty: 6.0), epsilon: 1.0))
        XCTAssertTrue(CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0)
            .nearlyEqual(to: CGAffineTransform(a: 1.0, b: 2.0, c: 2.1, d: 4.0, tx: 5.0, ty: 6.0), epsilon: 1.0))
        XCTAssertTrue(CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0)
            .nearlyEqual(to: CGAffineTransform(a: 1.0, b: 2.0, c: 3.9, d: 4.0, tx: 5.0, ty: 6.0), epsilon: 1.0))
        XCTAssertFalse(CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0)
            .nearlyEqual(to: CGAffineTransform(a: 1.0, b: 2.0, c: 4.0, d: 4.0, tx: 5.0, ty: 6.0), epsilon: 1.0))
        
        XCTAssertFalse(CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0)
            .nearlyEqual(to: CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 3.0, tx: 5.0, ty: 6.0), epsilon: 1.0))
        XCTAssertTrue(CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0)
            .nearlyEqual(to: CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 3.1, tx: 5.0, ty: 6.0), epsilon: 1.0))
        XCTAssertTrue(CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0)
            .nearlyEqual(to: CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.9, tx: 5.0, ty: 6.0), epsilon: 1.0))
        XCTAssertFalse(CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0)
            .nearlyEqual(to: CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 5.0, tx: 5.0, ty: 6.0), epsilon: 1.0))
        
        XCTAssertFalse(CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0)
            .nearlyEqual(to: CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 4.0, ty: 6.0), epsilon: 1.0))
        XCTAssertTrue(CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0)
            .nearlyEqual(to: CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 4.1, ty: 6.0), epsilon: 1.0))
        XCTAssertTrue(CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0)
            .nearlyEqual(to: CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.9, ty: 6.0), epsilon: 1.0))
        XCTAssertFalse(CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0)
            .nearlyEqual(to: CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 6.0, ty: 6.0), epsilon: 1.0))
        
        XCTAssertFalse(CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0)
            .nearlyEqual(to: CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 5.0), epsilon: 1.0))
        XCTAssertTrue(CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0)
            .nearlyEqual(to: CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 5.1), epsilon: 1.0))
        XCTAssertTrue(CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0)
            .nearlyEqual(to: CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.9), epsilon: 1.0))
        XCTAssertFalse(CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0)
            .nearlyEqual(to: CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 7.0), epsilon: 1.0))
    }

    func testInverse() {
        XCTAssertTrue(CGAffineTransform(a: 1, b: 2, c: 3, d: 4, tx: 5, ty: 6).inverse
            .nearlyEqual(to: CGAffineTransform(a: 1, b: 2, c: 3, d: 4, tx: 5, ty: 6).inverted(), epsilon: torelance))
    }
    
    func testDescription() {
        XCTAssertEqual(CGAffineTransform(a: 1, b: 2, c: 3, d: 4, tx: 5, ty: 6).description, "(1.0, 2.0, 3.0, 4.0, 5.0, 6.0)")
    }
    
    func testMultiply() {
        XCTAssertTrue((CGAffineTransform(a: 1, b: 2, c: 3, d: 4, tx: 5, ty: 6) ⊗ CGAffineTransform(a: 6, b: 5, c: 4, d: 3, tx: 2, ty: 1))
            .nearlyEqual(to: CGAffineTransform(a: 14, b: 11, c: 34, d: 27, tx: 56, ty: 44), epsilon: torelance))
    }
    
    func testMultiplyByPoint() {
        XCTAssertTrue((CGPoint(x: 1.0, y: 1.0) ⊗ CGAffineTransform(rotationAngle: CGFloat.pi / 4))
            .nearlyEqual(to: CGPoint(x: 0.0, y: sqrt(2)), epsilon: torelance))
        XCTAssertTrue((CGAffineTransform(translationX: 1.0, y: -2.0) ⊗ CGPoint(x: 1.0, y: 1.0))
            .nearlyEqual(to: CGPoint(x: 2.0, y: -1.0), epsilon: torelance))
    }
    
    func testEquals() {
        
    }
    
    func testMultiplicationAssignment() {
        var a = CGAffineTransform(a: 1, b: 2, c: 3, d: 4, tx: 5, ty: 6)
        a ⊗= CGAffineTransform(a: 6, b: 5, c: 4, d: 3, tx: 2, ty: 1)
        print(a)
        
        XCTAssertTrue(a.nearlyEqual(to: CGAffineTransform(a: 1, b: 2, c: 3, d: 4, tx: 5, ty: 6)
            ⊗ CGAffineTransform(a: 6, b: 5, c: 4, d: 3, tx: 2, ty: 1), epsilon: torelance))
    }
    
    static var allTests : [(String, (CGAffineTransormTests) -> () throws -> Void)] {
        return [
            ("testNearlyEqual", testNearlyEqual),
            ("testInverse", testInverse),
            ("testDescription", testDescription),
            ("testMultiply", testMultiply),
            ("testMultiplyByPoint", testMultiplyByPoint),
            ("testEquals", testEquals),
            ("testMultiplicationAssignment", testMultiplicationAssignment),
        ]
    }
}

import XCTest
import CGPointVector

class CGSizeTests: XCTestCase {
    let torelance: CGFloat = 1.0e-5;
    
    func testNearlyEqualTo() {
        XCTAssertFalse(CGSize(width: 1.0, height: 2.0).nearlyEqualTo(CGSize(width: 0.5, height: 2.0), epsilon: 0.5))
        XCTAssertTrue(CGSize(width: 1.0, height: 2.0).nearlyEqualTo(CGSize(width: 0.51, height: 2.0), epsilon: 0.5))
        XCTAssertTrue(CGSize(width: 1.0, height: 2.0).nearlyEqualTo(CGSize(width: 1.49, height: 2.0), epsilon: 0.5))
        XCTAssertFalse(CGSize(width: 1.0, height: 2.0).nearlyEqualTo(CGSize(width: 0.4, height: 2.0), epsilon: 0.5))
        
        XCTAssertFalse(CGSize(width: 1.0, height: 2.0).nearlyEqualTo(CGSize(width: 1.0, height: 1.0), epsilon: 1.0))
        XCTAssertTrue(CGSize(width: 1.0, height: 2.0).nearlyEqualTo(CGSize(width: 1.0, height: 1.1), epsilon: 1.0))
        XCTAssertTrue(CGSize(width: 1.0, height: 2.0).nearlyEqualTo(CGSize(width: 1.0, height: 2.9), epsilon: 1.0))
        XCTAssertFalse(CGSize(width: 1.0, height: 2.0).nearlyEqualTo(CGSize(width: 1.0, height: 3.0), epsilon: 1.0))
    }
    
    func testDescription() {
        XCTAssertEqual(CGSize(width: 1.0, height: 2.0).description, "(1.0, 2.0)")
    }
    
    func testPrefixPlus() {
        XCTAssertTrue((+CGSize(width: 1.0, height: -2.0)).nearlyEqualTo(CGSize(width: 1.0, height: -2.0), epsilon: torelance))
    }
    
    func testNegate() {
        XCTAssertTrue((-CGSize(width: 1.0, height: -2.0)).nearlyEqualTo(CGSize(width: -1.0, height: 2.0), epsilon: torelance))
    }
    
    func testAdd() {
        XCTAssertTrue((CGSize(width: 1.0, height: 2.0) + CGSize(width: 3.0, height: -4.0)).nearlyEqualTo(CGSize(width: 4.0, height: -2.0), epsilon: torelance))
    }
    
    func testSubtract() {
        XCTAssertTrue((CGSize(width: 3.0, height: 2.0) - CGSize(width: 1.0, height: 4.0)).nearlyEqualTo(CGSize(width: 2.0, height: -2.0), epsilon: torelance))
    }
    
    func testMultiply() {
        XCTAssertTrue((CGSize(width: 1.0, height: -2.0) * 3.0).nearlyEqualTo(CGSize(width: 3.0, height: -6.0), epsilon: torelance))
        XCTAssertTrue((3.0 * CGSize(width: 1.0, height: -2.0)).nearlyEqualTo(CGSize(width: 3.0, height: -6.0), epsilon: torelance))
    }
    
    func testDivide() {
        XCTAssertTrue((CGSize(width: 8.0, height: -2.0) / 4.0).nearlyEqualTo(CGSize(width: 2.0, height: -0.5), epsilon: torelance))
    }
    
    func testAdditionAssignment() {
        var a = CGSize(width: 1.0, height: 2.0)
        a += CGSize(width: 3.0, height: -4.0)
        XCTAssertTrue(a.nearlyEqualTo(CGSize(width: 1.0, height: 2.0)
            + CGSize(width: 3.0, height: -4.0), epsilon: torelance))
    }
    
    func testSuntractionAssignment() {
        var a = CGSize(width: 3.0, height: 2.0)
        a -= CGSize(width: 1.0, height: 4.0)
        XCTAssertTrue(a.nearlyEqualTo(CGSize(width: 3.0, height: 2.0)
            - CGSize(width: 1.0, height: 4.0), epsilon: torelance))
    }
    
    func testMultiplicationAssignment() {
        var a = CGSize(width: 1.0, height: -2.0)
        a *= 3.0
        XCTAssertTrue(a.nearlyEqualTo(CGSize(width: 1.0, height: -2.0) * 3, epsilon: torelance))
    }
    
    func testDivisionAssignment() {
        var a = CGSize(width: 8.0, height: -2.0)
        a /= 4.0
        XCTAssertTrue(a.nearlyEqualTo(CGSize(width: 8.0, height: -2.0) / 4.0, epsilon: torelance))
    }
    
    func testAddWithPoint() {
        XCTAssertTrue((CGSize(width: 1.0, height: 2.0) + CGPoint(x: 3.0, y: -4.0)).nearlyEqualTo(CGPoint(x: 4.0, y: -2.0), epsilon: torelance))
        XCTAssertTrue((CGPoint(x: 1.0, y: 2.0) + CGSize(width: 3.0, height: -4.0)).nearlyEqualTo(CGPoint(x: 4.0, y: -2.0), epsilon: torelance))
    }
    
    func testSubtractWithPoint() {
        XCTAssertTrue((CGSize(width: 3.0, height: 2.0) - CGPoint(x: 1.0, y: 4.0)).nearlyEqualTo(CGPoint(x: 2.0, y: -2.0), epsilon: torelance))
        XCTAssertTrue((CGPoint(x: 3.0, y: 2.0) - CGSize(width: 1.0, height: 4.0)).nearlyEqualTo(CGPoint(x: 2.0, y: -2.0), epsilon: torelance))
    }
    
    static var allTests : [(String, (CGSizeTests) -> () throws -> Void)] {
        return [
            ("testNearlyEqualTo", testNearlyEqualTo),
            ("testDescription", testDescription),
            ("testPrefixPlus", testPrefixPlus),
            ("testNegate", testNegate),
            ("testAdd", testAdd),
            ("testMultiply", testMultiply),
            ("testDivide", testDivide),
            ("testAdditionAssignment", testAdditionAssignment),
            ("testSuntractionAssignment", testSuntractionAssignment),
            ("testMultiplicationAssignment", testMultiplicationAssignment),
            ("testDivisionAssignment", testDivisionAssignment),
        ]
    }
}

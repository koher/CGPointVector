import XCTest
import CGPointVector

class CGPointTests: XCTestCase {
    let torelance: CGFloat = 1.0e-5;
    
    func testisNearlyEqual() {
        XCTAssertFalse(CGPoint(x: 1.0, y: 2.0).isNearlyEqual(to: CGPoint(x: 0.5, y: 2.0), epsilon: 0.5))
        XCTAssertTrue(CGPoint(x: 1.0, y: 2.0).isNearlyEqual(to: CGPoint(x: 0.51, y: 2.0), epsilon: 0.5))
        XCTAssertTrue(CGPoint(x: 1.0, y: 2.0).isNearlyEqual(to: CGPoint(x: 1.49, y: 2.0), epsilon: 0.5))
        XCTAssertFalse(CGPoint(x: 1.0, y: 2.0).isNearlyEqual(to: CGPoint(x: 0.4, y: 2.0), epsilon: 0.5))
        
        XCTAssertFalse(CGPoint(x: 1.0, y: 2.0).isNearlyEqual(to: CGPoint(x: 1.0, y: 1.0), epsilon: 1.0))
        XCTAssertTrue(CGPoint(x: 1.0, y: 2.0).isNearlyEqual(to: CGPoint(x: 1.0, y: 1.1), epsilon: 1.0))
        XCTAssertTrue(CGPoint(x: 1.0, y: 2.0).isNearlyEqual(to: CGPoint(x: 1.0, y: 2.9), epsilon: 1.0))
        XCTAssertFalse(CGPoint(x: 1.0, y: 2.0).isNearlyEqual(to: CGPoint(x: 1.0, y: 3.0), epsilon: 1.0))
    }
    
    func testLength() {
        XCTAssertEqual(CGPoint(x: 3.0, y: -4.0).length, 5.0, accuracy: torelance)
    }
    
    func testSquareLength() {
        XCTAssertEqual(CGPoint(x: 3.0, y: -4.0).squareLength, 25.0, accuracy: torelance)
    }
    
    func testUnit() {
        XCTAssertTrue(CGPoint(x: 3.0, y: -4.0).unit.isNearlyEqual(to: CGPoint(x: 0.6, y: -0.8), epsilon: torelance))
    }
    
    func testPhase() {
        XCTAssertEqual(CGPoint(x: 1.0, y: sqrt(3)).phase, CGFloat.pi / 3, accuracy: torelance)
    }
    
    func testDistance() {
        XCTAssertEqual(CGPoint(x: 1.0, y: 2.0).distance(from: CGPoint(x: -3.0, y: 5.0)), 5.0, accuracy: torelance)
    }
    
    func testSquareDistance() {
        XCTAssertEqual(CGPoint(x: 1.0, y: 2.0).squareDistance(from: CGPoint(x: -3.0, y: 5.0)), 25.0, accuracy: torelance)
    }
    
    func testAngle() {
        XCTAssertEqual(CGPoint(x: 1.0, y: 0.0).angle(from: CGPoint(x: sqrt(3.0), y: 1.0)), CGFloat.pi / 6, accuracy: torelance)
    }
    
    func testCos() {
        XCTAssertEqual(CGPoint(x: 1.0, y: 0.0).cos(from: CGPoint(x: 1.0, y: sqrt(3.0))), 0.5, accuracy: torelance)
    }
    
    func testDot() {
        XCTAssertEqual(CGPoint(x: 1.0, y: 2.0).dot(CGPoint(x: -3.0, y: 4.0)), 5.0, accuracy: torelance)
    }
    
    func testDescription() {
        XCTAssertEqual(CGPoint(x: 1.0, y: 2.0).description, "(1.0, 2.0)")
    }
    
    func testPrefixPlus() {
        XCTAssertTrue((+CGPoint(x: 1.0, y: -2.0)).isNearlyEqual(to: CGPoint(x: 1.0, y: -2.0), epsilon: torelance))
    }
    
    func testNegate() {
        XCTAssertTrue((-CGPoint(x: 1.0, y: -2.0)).isNearlyEqual(to: CGPoint(x: -1.0, y: 2.0), epsilon: torelance))
    }
    
    func testAdd() {
        XCTAssertTrue((CGPoint(x: 1.0, y: 2.0) + CGPoint(x: 3.0, y: -4.0)).isNearlyEqual(to: CGPoint(x: 4.0, y: -2.0), epsilon: torelance))
        XCTAssertTrue((CGPoint(x: 1.0, y: 2.0) + CGSize(width: 3.0, height: -4.0)).isNearlyEqual(to: CGPoint(x: 4.0, y: -2.0), epsilon: torelance))
    }
    
    func testSubtract() {
        XCTAssertTrue((CGPoint(x: 3.0, y: 2.0) - CGPoint(x: 1.0, y: 4.0)).isNearlyEqual(to: CGPoint(x: 2.0, y: -2.0), epsilon: torelance))
        XCTAssertTrue((CGPoint(x: 3.0, y: 2.0) - CGSize(width: 1.0, height: 4.0)).isNearlyEqual(to: CGPoint(x: 2.0, y: -2.0), epsilon: torelance))
    }
    
    func testMultiply() {
        XCTAssertTrue((CGPoint(x: 2.0, y: 3.0) * CGPoint(x: 5.0, y: 7.0)).isNearlyEqual(to: CGPoint(x: 10.0, y: 21.0), epsilon: torelance))
        XCTAssertTrue((CGPoint(x: 2.0, y: 3.0) * CGSize(width: 5.0, height: 7.0)).isNearlyEqual(to: CGPoint(x: 10.0, y: 21.0), epsilon: torelance))
        XCTAssertTrue((CGPoint(x: 1.0, y: -2.0) * 3.0).isNearlyEqual(to: CGPoint(x: 3.0, y: -6.0), epsilon: torelance))
        XCTAssertTrue((3.0 * CGPoint(x: 1.0, y: -2.0)).isNearlyEqual(to: CGPoint(x: 3.0, y: -6.0), epsilon: torelance))
    }
    
    func testDivide() {
        XCTAssertTrue((CGPoint(x: 8.0, y: 27.0) / CGPoint(x: 2.0, y: 3.0)).isNearlyEqual(to: CGPoint(x: 4.0, y: 9.0), epsilon: torelance))
        XCTAssertTrue((CGPoint(x: 8.0, y: 27.0) / CGSize(width: 2.0, height: 3.0)).isNearlyEqual(to: CGPoint(x: 4.0, y: 9.0), epsilon: torelance))
        XCTAssertTrue((CGPoint(x: 8.0, y: -2.0) / 4.0).isNearlyEqual(to: CGPoint(x: 2.0, y: -0.5), epsilon: torelance))
    }
    
    func testMatmul() {
        XCTAssertTrue((CGPoint(x: 1.0, y: 1.0) ⊗ CGAffineTransform(rotationAngle: CGFloat.pi / 4))
            .isNearlyEqual(to: CGPoint(x: 0.0, y: sqrt(2)), epsilon: torelance))
    }
    
    func testAdditionAssignment() {
        var a = CGPoint(x: 1.0, y: 2.0)
        a += CGPoint(x: 3.0, y: -4.0)
        XCTAssertTrue(a.isNearlyEqual(to: CGPoint(x: 1.0, y: 2.0)
            + CGPoint(x: 3.0, y: -4.0), epsilon: torelance))
    }
    
    func testSuntractionAssignment() {
        var a = CGPoint(x: 3.0, y: 2.0)
        a -= CGPoint(x: 1.0, y: 4.0)
        XCTAssertTrue(a.isNearlyEqual(to: CGPoint(x: 3.0, y: 2.0)
            - CGPoint(x: 1.0, y: 4.0), epsilon: torelance))
    }
    
    func testMultiplicationAssignment() {
        var a = CGPoint(x: 1.0, y: -2.0)
        a *= 3.0
        XCTAssertTrue(a.isNearlyEqual(to: CGPoint(x: 1.0, y: -2.0) * 3, epsilon: torelance))
    }
    
    func testDivisionAssignment() {
        var a = CGPoint(x: 8.0, y: -2.0)
        a /= 4.0
        XCTAssertTrue(a.isNearlyEqual(to: CGPoint(x: 8.0, y: -2.0) / 4.0, epsilon: torelance))
    }
    
    func testMatmulAssignment() {
        var a = CGPoint(x: 1.0, y: 1.0)
        a ⊗= CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        XCTAssertTrue(a.isNearlyEqual(to: CGPoint(x: 0.0, y: sqrt(2)), epsilon: torelance))
    }
    
    static var allTests : [(String, (CGPointTests) -> () throws -> Void)] {
        return [
            ("testisNearlyEqual", testisNearlyEqual),
            ("testLength", testLength),
            ("testSquareLength", testSquareLength),
            ("testUnit", testUnit),
            ("testPhase", testPhase),
            ("testDistance", testDistance),
            ("testSquareDistance", testSquareDistance),
            ("testAngle", testAngle),
            ("testCos", testCos),
            ("testDot", testDot),
            ("testDescription", testDescription),
            ("testPrefixPlus", testPrefixPlus),
            ("testNegate", testNegate),
            ("testAdd", testAdd),
            ("testSubtract", testSubtract),
            ("testMultiply", testMultiply),
            ("testDivide", testDivide),
            ("testMatmul", testMatmul),
            ("testAdditionAssignment", testAdditionAssignment),
            ("testSuntractionAssignment", testSuntractionAssignment),
            ("testMultiplicationAssignment", testMultiplicationAssignment),
            ("testDivisionAssignment", testDivisionAssignment),
            ("testMatmulAssignment", testMatmulAssignment),
        ]
    }
}

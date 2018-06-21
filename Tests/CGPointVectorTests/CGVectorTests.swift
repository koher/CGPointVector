import XCTest
import CGPointVector

class CGVectorTests: XCTestCase {
    let torelance: CGFloat = 1.0e-5;
    
    func testisNearlyEqual() {
        XCTAssertFalse(CGVector(dx: 1.0, dy: 2.0).isNearlyEqual(to: CGVector(dx: 0.5, dy: 2.0), epsilon: 0.5))
        XCTAssertTrue(CGVector(dx: 1.0, dy: 2.0).isNearlyEqual(to: CGVector(dx: 0.51, dy: 2.0), epsilon: 0.5))
        XCTAssertTrue(CGVector(dx: 1.0, dy: 2.0).isNearlyEqual(to: CGVector(dx: 1.49, dy: 2.0), epsilon: 0.5))
        XCTAssertFalse(CGVector(dx: 1.0, dy: 2.0).isNearlyEqual(to: CGVector(dx: 0.4, dy: 2.0), epsilon: 0.5))
        
        XCTAssertFalse(CGVector(dx: 1.0, dy: 2.0).isNearlyEqual(to: CGVector(dx: 1.0, dy: 1.0), epsilon: 1.0))
        XCTAssertTrue(CGVector(dx: 1.0, dy: 2.0).isNearlyEqual(to: CGVector(dx: 1.0, dy: 1.1), epsilon: 1.0))
        XCTAssertTrue(CGVector(dx: 1.0, dy: 2.0).isNearlyEqual(to: CGVector(dx: 1.0, dy: 2.9), epsilon: 1.0))
        XCTAssertFalse(CGVector(dx: 1.0, dy: 2.0).isNearlyEqual(to: CGVector(dx: 1.0, dy: 3.0), epsilon: 1.0))
    }
    
    func testLength() {
        XCTAssertEqual(CGVector(dx: 3.0, dy: -4.0).length, 5.0, accuracy: torelance)
    }
    
    func testSquareLength() {
        XCTAssertEqual(CGVector(dx: 3.0, dy: -4.0).squareLength, 25.0, accuracy: torelance)
    }
    
    func testUnit() {
        XCTAssertTrue(CGVector(dx: 3.0, dy: -4.0).unit.isNearlyEqual(to: CGVector(dx: 0.6, dy: -0.8), epsilon: torelance))
    }
    
    func testPhase() {
        XCTAssertEqual(CGVector(dx: 1.0, dy: sqrt(3)).phase, CGFloat.pi / 3, accuracy: torelance)
    }
    
    func testDistance() {
        XCTAssertEqual(CGVector(dx: 1.0, dy: 2.0).distance(from: CGVector(dx: -3.0, dy: 5.0)), 5.0, accuracy: torelance)
    }
    
    func testSquareDistance() {
        XCTAssertEqual(CGVector(dx: 1.0, dy: 2.0).squareDistance(from: CGVector(dx: -3.0, dy: 5.0)), 25.0, accuracy: torelance)
    }
    
    func testAngle() {
        XCTAssertEqual(CGVector(dx: 1.0, dy: 0.0).angle(from: CGVector(dx: sqrt(3.0), dy: 1.0)), CGFloat.pi / 6, accuracy: torelance)
    }
    
    func testCosOfAngle() {
        XCTAssertEqual(CGVector(dx: 1.0, dy: 0.0).cos(from: CGVector(dx: 1.0, dy: sqrt(3.0))), 0.5, accuracy: torelance)
    }
    
    func testDot() {
        XCTAssertEqual(CGVector(dx: 1.0, dy: 2.0).dot(CGVector(dx: -3.0, dy: 4.0)), 5.0, accuracy: torelance)
    }
    
    func testDescription() {
        XCTAssertEqual(CGVector(dx: 1.0, dy: 2.0).description, "(1.0, 2.0)")
    }
    
    func testPrefixPlus() {
        XCTAssertTrue((+CGVector(dx: 1.0, dy: -2.0)).isNearlyEqual(to: CGVector(dx: 1.0, dy: -2.0), epsilon: torelance))
    }
    
    func testNegate() {
        XCTAssertTrue((-CGVector(dx: 1.0, dy: -2.0)).isNearlyEqual(to: CGVector(dx: -1.0, dy: 2.0), epsilon: torelance))
    }
    
    func testAdd() {
        XCTAssertTrue((CGVector(dx: 1.0, dy: 2.0) + CGVector(dx: 3.0, dy: -4.0)).isNearlyEqual(to: CGVector(dx: 4.0, dy: -2.0), epsilon: torelance))
        XCTAssertTrue((CGVector(dx: 1.0, dy: 2.0) + CGPoint(x: 3.0, y: -4.0)).isNearlyEqual(to: CGPoint(x: 4.0, y: -2.0), epsilon: torelance))
    }
    
    func testSubtract() {
        XCTAssertTrue((CGVector(dx: 3.0, dy: 2.0) - CGVector(dx: 1.0, dy: 4.0)).isNearlyEqual(to: CGVector(dx: 2.0, dy: -2.0), epsilon: torelance))
        XCTAssertTrue((CGVector(dx: 3.0, dy: 2.0) - CGPoint(x: 1.0, y: 4.0)).isNearlyEqual(to: CGPoint(x: 2.0, y: -2.0), epsilon: torelance))
    }
    
    func testMultiply() {
        XCTAssertTrue((CGVector(dx: 2.0, dy: 3.0) * CGVector(dx: 5.0, dy: 7.0)).isNearlyEqual(to: CGVector(dx: 10.0, dy: 21.0), epsilon: torelance))
        XCTAssertTrue((CGVector(dx: 2.0, dy: 3.0) * CGPoint(x: 5.0, y: 7.0)).isNearlyEqual(to: CGPoint(x: 10.0, y: 21.0), epsilon: torelance))
        XCTAssertTrue((CGVector(dx: 1.0, dy: -2.0) * 3.0).isNearlyEqual(to: CGVector(dx: 3.0, dy: -6.0), epsilon: torelance))
        XCTAssertTrue((3.0 * CGVector(dx: 1.0, dy: -2.0)).isNearlyEqual(to: CGVector(dx: 3.0, dy: -6.0), epsilon: torelance))
    }
    
    func testDivide() {
        XCTAssertTrue((CGVector(dx: 8.0, dy: 27.0) / CGVector(dx: 2.0, dy: 3.0)).isNearlyEqual(to: CGVector(dx: 4.0, dy: 9.0), epsilon: torelance))
        XCTAssertTrue((CGVector(dx: 8.0, dy: 27.0) / CGPoint(x: 2.0, y: 3.0)).isNearlyEqual(to: CGPoint(x: 4.0, y: 9.0), epsilon: torelance))
        XCTAssertTrue((CGVector(dx: 8.0, dy: -2.0) / 4.0).isNearlyEqual(to: CGVector(dx: 2.0, dy: -0.5), epsilon: torelance))
    }
    
    func testMatmul() {
        XCTAssertTrue((CGVector(dx: 1.0, dy: 1.0) ⊗ CGAffineTransform(rotationAngle: CGFloat.pi / 4))
            .isNearlyEqual(to: CGVector(dx: 0.0, dy: sqrt(2)), epsilon: torelance))
    }
    
    func testAdditionAssignment() {
        var a = CGVector(dx: 1.0, dy: 2.0)
        a += CGVector(dx: 3.0, dy: -4.0)
        XCTAssertTrue(a.isNearlyEqual(to: CGVector(dx: 1.0, dy: 2.0)
            + CGVector(dx: 3.0, dy: -4.0), epsilon: torelance))
    }
    
    func testSuntractionAssignment() {
        var a = CGVector(dx: 3.0, dy: 2.0)
        a -= CGVector(dx: 1.0, dy: 4.0)
        XCTAssertTrue(a.isNearlyEqual(to: CGVector(dx: 3.0, dy: 2.0)
            - CGVector(dx: 1.0, dy: 4.0), epsilon: torelance))
    }
    
    func testMultiplicationAssignment() {
        var a = CGVector(dx: 1.0, dy: -2.0)
        a *= 3.0
        XCTAssertTrue(a.isNearlyEqual(to: CGVector(dx: 1.0, dy: -2.0) * 3, epsilon: torelance))
    }
    
    func testDivisionAssignment() {
        var a = CGVector(dx: 8.0, dy: -2.0)
        a /= 4.0
        XCTAssertTrue(a.isNearlyEqual(to: CGVector(dx: 8.0, dy: -2.0) / 4.0, epsilon: torelance))
    }
    
    func testMatmulAssignment() {
        var a = CGVector(dx: 1.0, dy: 1.0)
        a ⊗= CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        XCTAssertTrue(a.isNearlyEqual(to: CGVector(dx: 0.0, dy: sqrt(2)), epsilon: torelance))
    }
    
    static var allTests : [(String, (CGVectorTests) -> () throws -> Void)] {
        return [
            ("testisNearlyEqual", testisNearlyEqual),
            ("testLength", testLength),
            ("testSquareLength", testSquareLength),
            ("testUnit", testUnit),
            ("testPhase", testPhase),
            ("testDistance", testDistance),
            ("testSquareDistance", testSquareDistance),
            ("testAngle", testAngle),
            ("testCosOfAngle", testCosOfAngle),
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

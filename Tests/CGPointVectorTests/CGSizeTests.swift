import XCTest
import CGPointVector

class CGSizeTests: XCTestCase {
    let torelance: CGFloat = 1.0e-5;
    
    func testisNearlyEqual() {
        XCTAssertFalse(CGSize(width: 1.0, height: 2.0).isNearlyEqual(to: CGSize(width: 0.5, height: 2.0), epsilon: 0.5))
        XCTAssertTrue(CGSize(width: 1.0, height: 2.0).isNearlyEqual(to: CGSize(width: 0.51, height: 2.0), epsilon: 0.5))
        XCTAssertTrue(CGSize(width: 1.0, height: 2.0).isNearlyEqual(to: CGSize(width: 1.49, height: 2.0), epsilon: 0.5))
        XCTAssertFalse(CGSize(width: 1.0, height: 2.0).isNearlyEqual(to: CGSize(width: 0.4, height: 2.0), epsilon: 0.5))
        
        XCTAssertFalse(CGSize(width: 1.0, height: 2.0).isNearlyEqual(to: CGSize(width: 1.0, height: 1.0), epsilon: 1.0))
        XCTAssertTrue(CGSize(width: 1.0, height: 2.0).isNearlyEqual(to: CGSize(width: 1.0, height: 1.1), epsilon: 1.0))
        XCTAssertTrue(CGSize(width: 1.0, height: 2.0).isNearlyEqual(to: CGSize(width: 1.0, height: 2.9), epsilon: 1.0))
        XCTAssertFalse(CGSize(width: 1.0, height: 2.0).isNearlyEqual(to: CGSize(width: 1.0, height: 3.0), epsilon: 1.0))
    }
    
    func testLength() {
        XCTAssertEqual(CGSize(width: 3.0, height: -4.0).length, 5.0, accuracy: torelance)
    }
    
    func testSquareLength() {
        XCTAssertEqual(CGSize(width: 3.0, height: -4.0).squareLength, 25.0, accuracy: torelance)
    }
    
    func testUnit() {
        XCTAssertTrue(CGSize(width: 3.0, height: -4.0).unit.isNearlyEqual(to: CGSize(width: 0.6, height: -0.8), epsilon: torelance))
    }
    
    func testPhase() {
        XCTAssertEqual(CGSize(width: 1.0, height: sqrt(3)).phase, CGFloat.pi / 3, accuracy: torelance)
    }
    
    func testDistance() {
        XCTAssertEqual(CGSize(width: 1.0, height: 2.0).distance(from: CGSize(width: -3.0, height: 5.0)), 5.0, accuracy: torelance)
    }
    
    func testSquareDistance() {
        XCTAssertEqual(CGSize(width: 1.0, height: 2.0).squareDistance(from: CGSize(width: -3.0, height: 5.0)), 25.0, accuracy: torelance)
    }
    
    func testAngle() {
        XCTAssertEqual(CGSize(width: 1.0, height: 0.0).angle(from: CGSize(width: sqrt(3.0), height: 1.0)), CGFloat.pi / 6, accuracy: torelance)
        XCTAssertEqual(CGSize(width: 1.0, height: 0.0).angle(from: .zero), 0.0, accuracy: torelance)
        XCTAssertEqual(CGSize.zero.angle(from: CGSize(width: 0.0, height: 1.0)), 0.0, accuracy: torelance)
        XCTAssertEqual(CGSize.zero.angle(from: .zero), 0.0, accuracy: torelance)
    }
    
    func testCos() {
        XCTAssertEqual(CGSize(width: 1.0, height: 0.0).cos(from: CGSize(width: 1.0, height: sqrt(3.0))), 0.5, accuracy: torelance)
        XCTAssertEqual(CGSize(width: 1.0, height: 0.0).cos(from: .zero), 1.0, accuracy: torelance)
        XCTAssertEqual(CGSize.zero.cos(from: CGSize(width: 0.0, height: 1.0)), 1.0, accuracy: torelance)
        XCTAssertEqual(CGSize.zero.cos(from: .zero), 1.0, accuracy: torelance)
    }
    
    func testDot() {
        XCTAssertEqual(CGSize(width: 1.0, height: 2.0).dot(CGSize(width: -3.0, height: 4.0)), 5.0, accuracy: torelance)
    }
    
    func testDescription() {
        XCTAssertEqual(CGSize(width: 1.0, height: 2.0).description, "(1.0, 2.0)")
    }
    
    func testPrefixPlus() {
        XCTAssertTrue((+CGSize(width: 1.0, height: -2.0)).isNearlyEqual(to: CGSize(width: 1.0, height: -2.0), epsilon: torelance))
    }
    
    func testNegate() {
        XCTAssertTrue((-CGSize(width: 1.0, height: -2.0)).isNearlyEqual(to: CGSize(width: -1.0, height: 2.0), epsilon: torelance))
    }
    
    func testAdd() {
        XCTAssertTrue((CGSize(width: 1.0, height: 2.0) + CGSize(width: 3.0, height: -4.0)).isNearlyEqual(to: CGSize(width: 4.0, height: -2.0), epsilon: torelance))
        XCTAssertTrue((CGSize(width: 1.0, height: 2.0) + CGPoint(x: 3.0, y: -4.0)).isNearlyEqual(to: CGPoint(x: 4.0, y: -2.0), epsilon: torelance))
    }
    
    func testSubtract() {
        XCTAssertTrue((CGSize(width: 3.0, height: 2.0) - CGSize(width: 1.0, height: 4.0)).isNearlyEqual(to: CGSize(width: 2.0, height: -2.0), epsilon: torelance))
        XCTAssertTrue((CGSize(width: 3.0, height: 2.0) - CGPoint(x: 1.0, y: 4.0)).isNearlyEqual(to: CGPoint(x: 2.0, y: -2.0), epsilon: torelance))
    }
    
    func testMultiply() {
        XCTAssertTrue((CGSize(width: 2.0, height: 3.0) * CGSize(width: 5.0, height: 7.0)).isNearlyEqual(to: CGSize(width: 10.0, height: 21.0), epsilon: torelance))
        XCTAssertTrue((CGSize(width: 2.0, height: 3.0) * CGPoint(x: 5.0, y: 7.0)).isNearlyEqual(to: CGPoint(x: 10.0, y: 21.0), epsilon: torelance))
        XCTAssertTrue((CGSize(width: 1.0, height: -2.0) * 3.0).isNearlyEqual(to: CGSize(width: 3.0, height: -6.0), epsilon: torelance))
        XCTAssertTrue((3.0 * CGSize(width: 1.0, height: -2.0)).isNearlyEqual(to: CGSize(width: 3.0, height: -6.0), epsilon: torelance))
    }
    
    func testDivide() {
        XCTAssertTrue((CGSize(width: 8.0, height: 27.0) / CGSize(width: 2.0, height: 3.0)).isNearlyEqual(to: CGSize(width: 4.0, height: 9.0), epsilon: torelance))
        XCTAssertTrue((CGSize(width: 8.0, height: 27.0) / CGPoint(x: 2.0, y: 3.0)).isNearlyEqual(to: CGPoint(x: 4.0, y: 9.0), epsilon: torelance))
        XCTAssertTrue((CGSize(width: 8.0, height: -2.0) / 4.0).isNearlyEqual(to: CGSize(width: 2.0, height: -0.5), epsilon: torelance))
    }
    
    func testAdditionAssignment() {
        var a = CGSize(width: 1.0, height: 2.0)
        a += CGSize(width: 3.0, height: -4.0)
        XCTAssertTrue(a.isNearlyEqual(to: CGSize(width: 1.0, height: 2.0)
            + CGSize(width: 3.0, height: -4.0), epsilon: torelance))
    }
    
    func testSuntractionAssignment() {
        var a = CGSize(width: 3.0, height: 2.0)
        a -= CGSize(width: 1.0, height: 4.0)
        XCTAssertTrue(a.isNearlyEqual(to: CGSize(width: 3.0, height: 2.0)
            - CGSize(width: 1.0, height: 4.0), epsilon: torelance))
    }
    
    func testMultiplicationAssignment() {
        var a = CGSize(width: 1.0, height: -2.0)
        a *= 3.0
        XCTAssertTrue(a.isNearlyEqual(to: CGSize(width: 1.0, height: -2.0) * 3, epsilon: torelance))
    }
    
    func testDivisionAssignment() {
        var a = CGSize(width: 8.0, height: -2.0)
        a /= 4.0
        XCTAssertTrue(a.isNearlyEqual(to: CGSize(width: 8.0, height: -2.0) / 4.0, epsilon: torelance))
    }
    
    static var allTests : [(String, (CGSizeTests) -> () throws -> Void)] {
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
            ("testAdditionAssignment", testAdditionAssignment),
            ("testSuntractionAssignment", testSuntractionAssignment),
            ("testMultiplicationAssignment", testMultiplicationAssignment),
            ("testDivisionAssignment", testDivisionAssignment),
        ]
    }
}

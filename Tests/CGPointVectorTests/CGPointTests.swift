import XCTest
import CGPointVector

class CGPointTests: XCTestCase {
    let torelance: CGFloat = 1.0e-5;
    
    func testNearlyEqualTo() {
        XCTAssertFalse(CGPoint(x: 1.0, y: 2.0).nearlyEqualTo(CGPoint(x: 0.5, y: 2.0), epsilon: 0.5))
        XCTAssertTrue(CGPoint(x: 1.0, y: 2.0).nearlyEqualTo(CGPoint(x: 0.51, y: 2.0), epsilon: 0.5))
        XCTAssertTrue(CGPoint(x: 1.0, y: 2.0).nearlyEqualTo(CGPoint(x: 1.49, y: 2.0), epsilon: 0.5))
        XCTAssertFalse(CGPoint(x: 1.0, y: 2.0).nearlyEqualTo(CGPoint(x: 0.4, y: 2.0), epsilon: 0.5))
        
        XCTAssertFalse(CGPoint(x: 1.0, y: 2.0).nearlyEqualTo(CGPoint(x: 1.0, y: 1.0), epsilon: 1.0))
        XCTAssertTrue(CGPoint(x: 1.0, y: 2.0).nearlyEqualTo(CGPoint(x: 1.0, y: 1.1), epsilon: 1.0))
        XCTAssertTrue(CGPoint(x: 1.0, y: 2.0).nearlyEqualTo(CGPoint(x: 1.0, y: 2.9), epsilon: 1.0))
        XCTAssertFalse(CGPoint(x: 1.0, y: 2.0).nearlyEqualTo(CGPoint(x: 1.0, y: 3.0), epsilon: 1.0))
    }
    
    func testLength() {
        XCTAssertEqualWithAccuracy(CGPoint(x: 3.0, y: -4.0).length, 5.0, accuracy: torelance)
    }
    
    func testSquareLength() {
        XCTAssertEqualWithAccuracy(CGPoint(x: 3.0, y: -4.0).squareLength, 25.0, accuracy: torelance)
    }
    
    func testUnit() {
        XCTAssertTrue(CGPoint(x: 3.0, y: -4.0).unit.nearlyEqualTo(CGPoint(x: 0.6, y: -0.8), epsilon: torelance))
    }
    
    func testPhase() {
        XCTAssertEqualWithAccuracy(CGPoint(x: 1.0, y: sqrt(3)).phase, CGFloat.pi / 3, accuracy: torelance)
    }
    
    func testDistanceFrom() {
        XCTAssertEqualWithAccuracy(CGPoint(x: 1.0, y: 2.0).distanceFrom(CGPoint(x: -3.0, y: 5.0)), 5.0, accuracy: torelance)
    }
    
    func testSquareDistanceFrom() {
        XCTAssertEqualWithAccuracy(CGPoint(x: 1.0, y: 2.0).squareDistanceFrom(CGPoint(x: -3.0, y: 5.0)), 25.0, accuracy: torelance)
    }
    
    func testAngleFrom() {
        XCTAssertEqualWithAccuracy(CGPoint(x: 1.0, y: 0.0).angleFrom(CGPoint(x: sqrt(3.0), y: 1.0)), CGFloat.pi / 6, accuracy: torelance)
    }
    
    func testCosOfAngleFrom() {
        XCTAssertEqualWithAccuracy(CGPoint(x: 1.0, y: 0.0).cosOfAngleFrom(CGPoint(x: 1.0, y: sqrt(3.0))), 0.5, accuracy: torelance)
    }
    
    func testDescription() {
        XCTAssertEqual(CGPoint(x: 1.0, y: 2.0).description, "(1.0, 2.0)")
    }
    
    func testPrefixPlus() {
        XCTAssertTrue((+CGPoint(x: 1.0, y: -2.0)).nearlyEqualTo(CGPoint(x: 1.0, y: -2.0), epsilon: torelance))
    }
    
    func testNegate() {
        XCTAssertTrue((-CGPoint(x: 1.0, y: -2.0)).nearlyEqualTo(CGPoint(x: -1.0, y: 2.0), epsilon: torelance))
    }
    
    func testAdd() {
        XCTAssertTrue((CGPoint(x: 1.0, y: 2.0) + CGPoint(x: 3.0, y: -4.0)).nearlyEqualTo(CGPoint(x: 4.0, y: -2.0), epsilon: torelance))
    }
    
    func testSubtract() {
        XCTAssertTrue((CGPoint(x: 3.0, y: 2.0) - CGPoint(x: 1.0, y: 4.0)).nearlyEqualTo(CGPoint(x: 2.0, y: -2.0), epsilon: torelance))
    }
    
    func testMultiply() {
        XCTAssertEqualWithAccuracy(CGPoint(x: 1.0, y: 2.0) * CGPoint(x: -3.0, y: 4.0), 5.0, accuracy: torelance)
    }
    
    func testMultiplyByFloat() {
        XCTAssertTrue((CGPoint(x: 1.0, y: -2.0) * 3.0).nearlyEqualTo(CGPoint(x: 3.0, y: -6.0), epsilon: torelance))
        XCTAssertTrue((3.0 * CGPoint(x: 1.0, y: -2.0)).nearlyEqualTo(CGPoint(x: 3.0, y: -6.0), epsilon: torelance))
    }
    
    func testDivide() {
        XCTAssertTrue((CGPoint(x: 8.0, y: -2.0) / 4.0).nearlyEqualTo(CGPoint(x: 2.0, y: -0.5), epsilon: torelance))
    }
    
    func testAdditionAssignment() {
        var a = CGPoint(x: 1.0, y: 2.0)
        a += CGPoint(x: 3.0, y: -4.0)
        XCTAssertTrue(a.nearlyEqualTo(CGPoint(x: 1.0, y: 2.0)
            + CGPoint(x: 3.0, y: -4.0), epsilon: torelance))
    }
    
    func testSuntractionAssignment() {
        var a = CGPoint(x: 3.0, y: 2.0)
        a -= CGPoint(x: 1.0, y: 4.0)
        XCTAssertTrue(a.nearlyEqualTo(CGPoint(x: 3.0, y: 2.0)
            - CGPoint(x: 1.0, y: 4.0), epsilon: torelance))
    }
    
    func testMultiplicationAssignment() {
        var a = CGPoint(x: 1.0, y: -2.0)
        a *= 3.0
        XCTAssertTrue(a.nearlyEqualTo(CGPoint(x: 1.0, y: -2.0) * 3, epsilon: torelance))
    }
    
    func testDivisionAssignment() {
        var a = CGPoint(x: 8.0, y: -2.0)
        a /= 4.0
        XCTAssertTrue(a.nearlyEqualTo(CGPoint(x: 8.0, y: -2.0) / 4.0, epsilon: torelance))
    }
    
    static var allTests : [(String, (CGPointTests) -> () throws -> Void)] {
        return [
            ("testNearlyEqualTo", testNearlyEqualTo),
            ("testLength", testLength),
            ("testSquareLength", testSquareLength),
            ("testUnit", testUnit),
            ("testPhase", testPhase),
            ("testDistanceFrom", testDistanceFrom),
            ("testSquareDistanceFrom", testSquareDistanceFrom),
            ("testAngleFrom", testAngleFrom),
            ("testCosOfAngleFrom", testCosOfAngleFrom),
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

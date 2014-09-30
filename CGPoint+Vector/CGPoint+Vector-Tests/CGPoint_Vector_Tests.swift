import UIKit
import XCTest

class CGPoint_Vector_Tests: XCTestCase {
	let torelance: CGFloat = 1.0e-5;

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

	func testNearlyEqualTo() {
		XCTAssert(CGPoint(x: 1.0, y: 2.0).nearlyEqualTo(CGPoint(x: 1.0, y: 2.9), epsilon: 1.0))
		XCTAssert(!CGPoint(x: 1.0, y: 2.0).nearlyEqualTo(CGPoint(x: 1.0, y: 3.0), epsilon: 1.0))
		XCTAssert(CGPoint(x: 1.0, y: 2.0).nearlyEqualTo(CGPoint(x: 0.51, y: 2.0), epsilon: 0.5))
		XCTAssert(!CGPoint(x: 1.0, y: 2.0).nearlyEqualTo(CGPoint(x: 0.5, y: 2.0), epsilon: 0.5))
	}
	
	func testAdd() {
		XCTAssert((CGPoint(x: 1.0, y: 2.0) + CGPoint(x: 3.0, y: -4.0)).nearlyEqualTo(CGPoint(x: 4.0, y: -2.0), epsilon: torelance))
	}
	
	func testSubtract() {
		XCTAssert((CGPoint(x: 3.0, y: 2.0) - CGPoint(x: 1.0, y: 4.0)).nearlyEqualTo(CGPoint(x: 2.0, y: -2.0), epsilon: torelance))
	}
	
	func testMultiply() {
		XCTAssert((CGPoint(x: 1.0, y: -2.0) * 3.0).nearlyEqualTo(CGPoint(x: 3.0, y: -6.0), epsilon: torelance))
	}
	
	func testNegate() {
		XCTAssert((-CGPoint(x: 1.0, y: -2.0)).nearlyEqualTo(CGPoint(x: -1.0, y: 2.0), epsilon: torelance))
	}
	
	func testUnit() {
		XCTAssert(CGPoint(x: 3.0, y: -4.0).unit.nearlyEqualTo(CGPoint(x: 0.6, y: -0.8), epsilon: torelance))
	}
	
	func testLength() {
		XCTAssertEqualWithAccuracy(CGPoint(x: 3.0, y: -4.0).length, 5.0, torelance)
	}
	
	func testSquareLength() {
		XCTAssertEqualWithAccuracy(CGPoint(x: 3.0, y: -4.0).squareLength, 25.0, torelance)
	}
	
	func testDistance() {
		XCTAssertEqualWithAccuracy(CGPoint(x: 1.0, y: 2.0).distanceFrom(CGPoint(x: -3.0, y: 5.0)), 5.0, torelance)
	}
	
	func testSquareDistance() {
		XCTAssertEqualWithAccuracy(CGPoint(x: 1.0, y: 2.0).squareDistanceFrom(CGPoint(x: -3.0, y: 5.0)), 25.0, torelance)
	}
	
	func testDotProduct() {
		XCTAssertEqualWithAccuracy(CGPoint(x: 1.0, y: 2.0) * CGPoint(x: -3.0, y: 4.0), 5.0, torelance)
	}
	
	func testAngleFrom() {
		XCTAssertEqualWithAccuracy(CGPoint(x: 1.0, y: 0.0).angleFrom(CGPoint(x: sqrt(3.0), y: 1.0)), CGFloat(M_PI) / 6, torelance)
	}
	
	func testCosOfAngleFrom() {
		XCTAssertEqualWithAccuracy(CGPoint(x: 1.0, y: 0.0).cosOfAngleFrom(CGPoint(x: 1.0, y: sqrt(3.0))), 0.5, torelance)
	}
	
}

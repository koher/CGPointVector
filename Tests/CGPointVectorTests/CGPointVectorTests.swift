import XCTest
@testable import CGPointVector

class CGPointVectorTests: XCTestCase {
    let torelance: CGFloat = 1.0e-5;
    
    func testExample() {
        let a = CGPoint(x: 1, y: 2), b = CGPoint(x: -3, y: 5)
        
        let sum = a + b // (-2.0, 7.0)
        let distance = (b - a).length // 5.0
        let direction = (b - a).unit // (-0.8, 0.6)
        let rotated = a * CGAffineTransform(rotationAngle: CGFloat.pi / 2) // (-2.0, 1.0)

        /**/ XCTAssertTrue(sum.isNearlyEqual(to: CGPoint(x: -2.0, y: 7.0), epsilon: torelance))
        /**/ XCTAssertEqual(distance, 5.0, accuracy: torelance)
        /**/ XCTAssertTrue(direction.isNearlyEqual(to: CGPoint(x: -0.8, y: 0.6), epsilon: torelance))
        /**/ XCTAssertTrue(rotated.isNearlyEqual(to: CGPoint(x: -2.0, y: 1.0), epsilon: torelance))
    }
    
    func testUsage() {
        let a = CGPoint(x: 3.0, y: -4.0)
        let b = CGPoint(x: 2.0, y: -5.0)
        
        let sum = a + b // (5.0, -9.0)
        let length = a.length // 5.0
        let distance = a.distance(from: b) // 1.4142135623731
        let unitVector = a.unit // (0.6, -0.8)
        let dotProduct = a.dot(b) // 26.0

        /**/ XCTAssertTrue(sum.isNearlyEqual(to: CGPoint(x: 5.0, y: -9.0), epsilon: torelance))
        /**/ XCTAssertEqual(length, 5.0, accuracy: torelance)
        /**/ XCTAssertEqual(distance, 1.4142135623731, accuracy: torelance)
        /**/ XCTAssertTrue(unitVector.isNearlyEqual(to: CGPoint(x: 0.6, y: -0.8), epsilon: torelance))
        /**/ XCTAssertEqual(dotProduct, 26.0, accuracy: torelance)
    }
    
    static var allTests : [(String, (CGPointVectorTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
            ("testUsage", testUsage),
        ]
    }
}

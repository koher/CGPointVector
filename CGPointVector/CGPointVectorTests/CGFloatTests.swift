import XCTest
import CGPointVector

class CGFloatTests: XCTestCase {
    let torelance: CGFloat = 1.0e-5;
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPi() {
        XCTAssertEqual(CGFloat.pi, CGFloat(M_PI))
    }
    
    func testE() {
        XCTAssertEqual(CGFloat.e, CGFloat(M_E))
    }
}

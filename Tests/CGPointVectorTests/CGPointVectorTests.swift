import XCTest
@testable import CGPointVector

class CGPointVectorTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(CGPointVector().text, "Hello, World!")
    }


    static var allTests : [(String, (CGPointVectorTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}

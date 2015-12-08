#import <XCTest/XCTest.h>

#import <CGPointVector/CGPointVector.h>

static const CGFloat Torelance = 1.0e-5;

@interface CGPointVectorObjCTests : XCTestCase

@end

@implementation CGPointVectorObjCTests

- (void)setUp {
	[super setUp];
}

- (void)tearDown {
	[super tearDown];
}

- (void)testNearlyEqualToPoint {
	XCTAssert(CGPointNearlyEqualToPoint(CGPointMake(1.0, 2.0), CGPointMake(1.0, 2.9), 1.0));
	XCTAssert(!CGPointNearlyEqualToPoint(CGPointMake(1.0, 2.0), CGPointMake(1.0, 3.0), 1.0));
	XCTAssert(CGPointNearlyEqualToPoint(CGPointMake(1.0, 2.0), CGPointMake(0.51, 2.0), 0.5));
	XCTAssert(!CGPointNearlyEqualToPoint(CGPointMake(1.0, 2.0), CGPointMake(0.5, 2.0), 0.5));
}

- (void)testAdd {
	XCTAssert(CGPointNearlyEqualToPoint(CGPointAdd(CGPointMake(1.0, 2.0), CGPointMake(3.0, -4.0)), CGPointMake(4.0, -2.0), Torelance));
}

- (void)testSubtract {
	XCTAssert(CGPointNearlyEqualToPoint(CGPointSubtract(CGPointMake(3.0, 2.0), CGPointMake(1.0, 4.0)), CGPointMake(2.0, -2.0), Torelance));
}

- (void)testMultiply {
	XCTAssert(CGPointNearlyEqualToPoint(CGPointMultiply(CGPointMake(1.0, -2.0), 3.0), CGPointMake(3.0, -6.0), Torelance));
}

- (void)testNegate {
	XCTAssert(CGPointNearlyEqualToPoint(CGPointNegate(CGPointMake(1.0, -2.0)), CGPointMake(-1.0, 2.0), Torelance));
}

- (void)testNormalize {
	XCTAssert(CGPointNearlyEqualToPoint(CGPointNormalize(CGPointMake(3.0, -4.0)), CGPointMake(0.6, -0.8), Torelance));
}

- (void)testGetLength {
	XCTAssertEqualWithAccuracy(CGPointGetLength(CGPointMake(3.0, -4.0)), 5.0, Torelance);
}

- (void)testGetSquareLength {
	XCTAssertEqualWithAccuracy(CGPointGetSquareLength(CGPointMake(3.0, -4.0)), 25.0, Torelance);
}

- (void)testGetDistance {
	XCTAssertEqualWithAccuracy(CGPointGetDistance(CGPointMake(1.0, 2.0), CGPointMake(-3.0, 5.0)), 5.0, Torelance);
}

- (void)testGetSquareDistance {
	XCTAssertEqualWithAccuracy(CGPointGetSquareDistance(CGPointMake(1.0, 2.0), CGPointMake(-3.0, 5.0)), 25.0, Torelance);
}

- (void)testGetDotProduct {
	XCTAssertEqualWithAccuracy(CGPointGetDotProduct(CGPointMake(1.0, 2.0), CGPointMake(-3.0, 4.0)), 5.0, Torelance);
}

- (void)testGetAngleBetween {
	XCTAssertEqualWithAccuracy(CGPointGetAngleBetween(CGPointMake(1.0, 0.0), CGPointMake(sqrt(3.0), 1.0)), M_PI / 6, Torelance);
}

- (void)testGetCosOfAngleBetween {
	XCTAssertEqualWithAccuracy(CGPointGetCosOfAngleBetween(CGPointMake(1.0, 0.0), CGPointMake(1.0, sqrt(3.0))), 0.5, Torelance);
}

@end

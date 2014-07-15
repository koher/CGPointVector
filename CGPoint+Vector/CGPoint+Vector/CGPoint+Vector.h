#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

FOUNDATION_EXPORT CGPoint CGPointAdd(CGPoint point1, CGPoint point2);
FOUNDATION_EXPORT CGPoint CGPointSubtract(CGPoint point1, CGPoint point2);
FOUNDATION_EXPORT CGPoint CGPointMultiply(CGPoint point, CGFloat k);

FOUNDATION_EXPORT CGPoint CGPointNegate(CGPoint point);
FOUNDATION_EXPORT CGPoint CGPointNormalize(CGPoint point);

FOUNDATION_EXPORT CGFloat CGPointGetLength(CGPoint point);
FOUNDATION_EXPORT CGFloat CGPointGetSquareLength(CGPoint point);

FOUNDATION_EXPORT CGFloat CGPointGetDistance(CGPoint point1, CGPoint point2);
FOUNDATION_EXPORT CGFloat CGPointGetSquareDistance(CGPoint point1, CGPoint point2);

FOUNDATION_EXPORT CGFloat CGPointGetDotProduct(CGPoint point1, CGPoint point2);

FOUNDATION_EXPORT CGFloat CGPointGetAngleBetween(CGPoint point1, CGPoint point2);
FOUNDATION_EXPORT CGFloat CGPointGetCosOfAngleBetween(CGPoint point1, CGPoint point2);

FOUNDATION_EXPORT BOOL CGPointNearlyEqualToPoint(CGPoint point1, CGPoint point2, CGFloat epsilon);

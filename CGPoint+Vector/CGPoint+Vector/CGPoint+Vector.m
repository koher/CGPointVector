#import "CGPoint+Vector.h"

CGPoint CGPointAdd(CGPoint point1, CGPoint point2) {
	return CGPointMake(point1.x + point2.x, point1.y + point2.y);
}

CGPoint CGPointSubtract(CGPoint point1, CGPoint point2) {
	return CGPointMake(point1.x - point2.x, point1.y - point2.y);
}

CGPoint CGPointMultiply(CGPoint point, CGFloat k) {
	return CGPointMake(point.x * k, point.y * k);
}

CGPoint CGPointNegate(CGPoint point) {
	return CGPointMultiply(point, -1);
}

CGPoint CGPointNormalize(CGPoint point) {
	return CGPointMultiply(point, 1 / CGPointGetLength(point));
}

CGFloat CGPointGetLength(CGPoint point) {
#if defined(__LP64__) && __LP64__
	return sqrt(CGPointGetSquareLength(point));
#else
	return sqrtf(CGPointGetSquareLength(point));
#endif
}

CGFloat CGPointGetSquareLength(CGPoint point) {
	return point.x * point.x + point.y * point.y;
}

CGFloat CGPointGetDistance(CGPoint point1, CGPoint point2) {
#if defined(__LP64__) && __LP64__
	return sqrt(CGPointGetSquareDistance(point1, point2));
#else
	return sqrtf(CGPointGetSquareDistance(point1, point2));
#endif
}

CGFloat CGPointGetSquareDistance(CGPoint point1, CGPoint point2) {
	return CGPointGetSquareLength(CGPointSubtract(point1, point2));
}

CGFloat CGPointGetDotProduct(CGPoint point1, CGPoint point2) {
	return point1.x * point2.x + point1.y * point2.y;
}

CGFloat CGPointGetAngleBetween(CGPoint point1, CGPoint point2) {
#if defined(__LP64__) && __LP64__
	return acos(CGPointGetCosOfAngleBetween(point1, point2));
#else
	return acosf(CGPointGetCosOfAngleBetween(point1, point2));
#endif
}

CGFloat CGPointGetCosOfAngleBetween(CGPoint point1, CGPoint point2) {
#if defined(__LP64__) && __LP64__
	return fmin(fmax(CGPointGetDotProduct(point1, point2) / sqrt(CGPointGetSquareLength(point1) * CGPointGetSquareLength(point2)), -1.0), 1.0);
#else
	return fminf(fmaxf(CGPointGetDotProduct(point1, point2) / sqrt(CGPointGetSquareLength(point1) * CGPointGetSquareLength(point2)), -1.0f), 1.0f);
#endif
}

BOOL CGPointNearlyEqualToPoint(CGPoint point1, CGPoint point2, CGFloat epsilon) {
	CGPoint difference = CGPointSubtract(point1, point2);
#if defined(__LP64__) && __LP64__
	return fabs(difference.x) < epsilon && fabs(difference.y) < epsilon;
#else
	return fabsf(difference.x) < epsilon && fabsf(difference.y) < epsilon;
#endif
}

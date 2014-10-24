import CoreGraphics

extension CGPoint {
	var description: String {
		return "(\(x), \(y))"
	}
	
	var length: CGFloat {
		return sqrt(squareLength)
	}
	
	var squareLength: CGFloat {
		return x * x + y * y
	}
	
	var unit: CGPoint {
		return self * (1.0 / length)
	}
	
	var phase: CGFloat {
		return atan2(y, x)
	}
	
	func distanceFrom(point: CGPoint) -> CGFloat {
		return (self - point).length
	}
	
	func squareDistanceFrom(point: CGPoint) -> CGFloat {
		return (self - point).squareLength
	}
	
	func angleFrom(point: CGPoint) -> CGFloat {
		return acos(cosOfAngleFrom(point))
	}
	
	func cosOfAngleFrom(point: CGPoint) -> CGFloat {
		return fmin(fmax(self * point / sqrt(self.squareLength * point.squareLength), -1.0), 1.0)
	}
	
	func nearlyEqualTo(point: CGPoint, epsilon: CGFloat) -> Bool {
		let difference = self - point
		return fabs(difference.x) < epsilon && fabs(difference.y) < epsilon
	}
}

prefix func + (value: CGPoint) -> CGPoint {
	return value
}

prefix func - (value: CGPoint) -> CGPoint {
	return CGPoint(x: -value.x, y: -value.y)
}

func + (left: CGPoint, right: CGPoint) -> CGPoint {
	return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func - (left: CGPoint, right: CGPoint) -> CGPoint {
	return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

func * (left: CGPoint, right: CGPoint) -> CGFloat {
	return left.x * right.x + left.y * right.y
}

func * (left: CGPoint, right: CGFloat) -> CGPoint {
	return CGPoint(x: left.x * right, y: left.y * right)
}

func * (left: CGFloat, right: CGPoint) -> CGPoint {
	return CGPoint(x: right.x * left, y: right.y * left)
}

func / (left: CGPoint, right: CGFloat) -> CGPoint {
	return CGPoint(x: left.x / right, y: left.y / right)
}

func == (left: CGPoint, right: CGPoint) -> Bool {
	return CGPointEqualToPoint(left, right)
}

func += (inout left: CGPoint, right: CGPoint) {
	left = left + right
}

func -= (inout left: CGPoint, right: CGPoint) {
	left = left - right
}

func *= (inout left: CGPoint, right: CGFloat) {
	left = left * right
}

func /= (inout left: CGPoint, right: CGFloat) {
	left = left / right
}

extension CGAffineTransform {
	var inverse: CGAffineTransform {
		return CGAffineTransformInvert(self)
	}
	
	func isIdentity() -> Bool {
		return CGAffineTransformIsIdentity(self)
	}
	
	func nearlyEqualTo(transform: CGAffineTransform, epsilon: CGFloat) -> Bool {
		return fabs(a - transform.a) < epsilon && fabs(b - transform.b) < epsilon && fabs(c - transform.c) < epsilon && fabs(d - transform.d) < epsilon && fabs(tx - transform.tx) < epsilon && fabs(ty - transform.ty) < epsilon
	}
}

func * (left: CGAffineTransform, right: CGAffineTransform) -> CGAffineTransform {
	return CGAffineTransformConcat(left, right)
}

func * (left: CGAffineTransform, right: CGPoint) -> CGPoint {
	return CGPointApplyAffineTransform(right, left)
}

func * (left: CGPoint, right: CGAffineTransform) -> CGPoint {
	return CGPointApplyAffineTransform(left, right)
}

func == (left: CGAffineTransform, right: CGAffineTransform) -> Bool {
	return CGAffineTransformEqualToTransform(left, right)
}

extension CGSize {
	func nearlyEqualTo(point: CGSize, epsilon: CGFloat) -> Bool {
		let difference = self - point
		return fabs(difference.width) < epsilon && fabs(difference.height) < epsilon
	}
}

func + (left: CGSize, right: CGSize) -> CGSize {
	return CGSize(width: left.width + right.width, height: left.height + right.height)
}

func - (left: CGSize, right: CGSize) -> CGSize {
	return CGSize(width: left.width - right.width, height: left.height - right.height)
}

func * (left: CGSize, right: CGAffineTransform) -> CGSize {
	return CGSizeApplyAffineTransform(left, right)
}

func * (left: CGSize, right: CGFloat) -> CGSize {
	return CGSize(width: left.width * right, height: left.height * right)
}

func * (left: CGFloat, right: CGSize) -> CGSize {
	return CGSize(width: right.width * left, height: right.height * left)
}

func / (left: CGSize, right: CGFloat) -> CGSize {
	return CGSize(width: left.width / right, height: left.height / right)
}

func == (left: CGSize, right: CGSize) -> Bool {
	return CGSizeEqualToSize(left, right)
}

extension CGRect {
	var center: CGPoint {
		return CGPoint(x: midX, y: midY)
	}
}

func * (left: CGRect, right: CGAffineTransform) -> CGRect {
	return CGRectApplyAffineTransform(left, right)
}

func == (left: CGRect, right: CGRect) -> Bool {
	return CGRectEqualToRect(left, right)
}

extension CGFloat {
	static var pi: CGFloat {
		return CGFloat(M_PI)
	}
	static var e: CGFloat {
		return CGFloat(M_E)
	}
}

func + (left: CGPoint, right: CGSize) -> CGPoint {
	return CGPoint(x: left.x + right.width, y: left.y + right.height)
}

func + (left: CGSize, right: CGPoint) -> CGPoint {
	return CGPoint(x: left.width + right.x, y: left.height + right.y)
}

func - (left: CGPoint, right: CGSize) -> CGPoint {
	return CGPoint(x: left.x - right.width, y: left.y - right.height)
}

func - (left: CGSize, right: CGPoint) -> CGPoint {
	return CGPoint(x: left.width - right.x, y: left.height - right.y)
}

import CoreGraphics

extension CGPoint {
	var description: String {
		return "(\(self.x), \(self.y))"
	}
	
	var length: CGFloat {
		return sqrt(self.squareLength)
	}
	
	var squareLength: CGFloat {
		return sqrt(self.squareLength)
	}
	
	var unit: CGPoint {
		return self * (1.0 / self.length)
	}
	
	var phase: CGFloat {
		return atan2(self.y, self.x)
	}
	
	func distanceFrom(point: CGPoint) -> CGFloat {
		return (self - point).length
	}
	
	func squareDistanceFrom(point: CGPoint) -> CGFloat {
		return (self - point).squareLength
	}
	
	func angleFrom(point: CGPoint) -> CGFloat {
		return acos(self.cosOfAngleFrom(point))
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

extension CGAffineTransform {
	var inverse: CGAffineTransform {
		return CGAffineTransformInvert(self)
	}
	
	func isIdentity() -> Bool {
		return CGAffineTransformIsIdentity(self)
	}
	
	func nearlyEqualTo(transform: CGAffineTransform, epsilon: CGFloat) -> Bool {
		return fabs(self.a - transform.a) < epsilon && fabs(self.b - transform.b) < epsilon && fabs(self.c - transform.c) < epsilon && fabs(self.d - transform.d) < epsilon && fabs(self.tx - transform.tx) < epsilon && fabs(self.ty - transform.ty) < epsilon
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

extension CGFloat {
	static var pi: CGFloat {
		return CGFloat(M_PI)
	}
	static var e: CGFloat {
		return CGFloat(M_E)
	}
}
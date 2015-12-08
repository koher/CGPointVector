import CoreGraphics

extension CGPoint {
	public var description: String {
		return "(\(x), \(y))"
	}
	
	public var length: CGFloat {
		return sqrt(squareLength)
	}
	
	public var squareLength: CGFloat {
		return x * x + y * y
	}
	
	public var unit: CGPoint {
		return self * (1.0 / length)
	}
	
	public var phase: CGFloat {
		return atan2(y, x)
	}
	
	public func distanceFrom(point: CGPoint) -> CGFloat {
		return (self - point).length
	}
	
	public func squareDistanceFrom(point: CGPoint) -> CGFloat {
		return (self - point).squareLength
	}
	
	public func angleFrom(point: CGPoint) -> CGFloat {
		return acos(cosOfAngleFrom(point))
	}
	
	public func cosOfAngleFrom(point: CGPoint) -> CGFloat {
		return fmin(fmax(self * point / sqrt(self.squareLength * point.squareLength), -1.0), 1.0)
	}
	
	public func nearlyEqualTo(point: CGPoint, epsilon: CGFloat) -> Bool {
		let difference = self - point
		return fabs(difference.x) < epsilon && fabs(difference.y) < epsilon
	}
}

public prefix func + (value: CGPoint) -> CGPoint {
	return value
}

public prefix func - (value: CGPoint) -> CGPoint {
	return CGPoint(x: -value.x, y: -value.y)
}

public func + (left: CGPoint, right: CGPoint) -> CGPoint {
	return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

public func - (left: CGPoint, right: CGPoint) -> CGPoint {
	return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

public func * (left: CGPoint, right: CGPoint) -> CGFloat {
	return left.x * right.x + left.y * right.y
}

public func * (left: CGPoint, right: CGFloat) -> CGPoint {
	return CGPoint(x: left.x * right, y: left.y * right)
}

public func * (left: CGFloat, right: CGPoint) -> CGPoint {
	return CGPoint(x: right.x * left, y: right.y * left)
}

public func / (left: CGPoint, right: CGFloat) -> CGPoint {
	return CGPoint(x: left.x / right, y: left.y / right)
}

public func == (left: CGPoint, right: CGPoint) -> Bool {
	return CGPointEqualToPoint(left, right)
}

public func += (inout left: CGPoint, right: CGPoint) {
	left = left + right
}

public func -= (inout left: CGPoint, right: CGPoint) {
	left = left - right
}

public func *= (inout left: CGPoint, right: CGFloat) {
	left = left * right
}

public func /= (inout left: CGPoint, right: CGFloat) {
	left = left / right
}

extension CGAffineTransform {
	public var inverse: CGAffineTransform {
		return CGAffineTransformInvert(self)
	}
	
	public func isIdentity() -> Bool {
		return CGAffineTransformIsIdentity(self)
	}
	
	public func nearlyEqualTo(transform: CGAffineTransform, epsilon: CGFloat) -> Bool {
		return fabs(a - transform.a) < epsilon && fabs(b - transform.b) < epsilon && fabs(c - transform.c) < epsilon && fabs(d - transform.d) < epsilon && fabs(tx - transform.tx) < epsilon && fabs(ty - transform.ty) < epsilon
	}
}

public func * (left: CGAffineTransform, right: CGAffineTransform) -> CGAffineTransform {
	return CGAffineTransformConcat(left, right)
}

public func * (left: CGAffineTransform, right: CGPoint) -> CGPoint {
	return CGPointApplyAffineTransform(right, left)
}

public func * (left: CGPoint, right: CGAffineTransform) -> CGPoint {
	return CGPointApplyAffineTransform(left, right)
}

public func == (left: CGAffineTransform, right: CGAffineTransform) -> Bool {
	return CGAffineTransformEqualToTransform(left, right)
}

extension CGFloat {
	public static var pi: CGFloat {
		return CGFloat(M_PI)
	}
	public static var e: CGFloat {
		return CGFloat(M_E)
	}
}
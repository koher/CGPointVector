import CoreGraphics

extension CGPoint {
	var description: String {
		get {
			return "( \(self.x), \(self.y) )"
		}
	}
	
	var length: CGFloat {
		get {
			return sqrt(self.squareLength)
		}
	}
	
	var squareLength: CGFloat {
		get {
			return self.x * self.x + self.y * self.y
		}
	}
	
	var unit: CGPoint {
		get {
			return self * (1.0 / self.length)
		}
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

func == (left: CGPoint, right: CGPoint) -> Bool {
	return CGPointEqualToPoint(left, right)
}
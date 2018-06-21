import CoreGraphics

extension CGPoint {
    public func isNearlyEqual(to point: CGPoint, epsilon: CGFloat) -> Bool {
        let difference = self - point
        return fabs(difference.x) < epsilon && fabs(difference.y) < epsilon
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
    
    public func distance(from point: CGPoint) -> CGFloat {
        return (self - point).length
    }
    
    public func squareDistance(from point: CGPoint) -> CGFloat {
        return (self - point).squareLength
    }
    
    public func angle(from point: CGPoint) -> CGFloat {
        return acos(cos(from: point))
    }
    
    public func cos(from point: CGPoint) -> CGFloat {
        return fmin(fmax(self.dot(point) / sqrt(self.squareLength * point.squareLength), -1.0), 1.0)
    }
    
    public func dot(_ other: CGPoint) -> CGFloat {
        return self.x * other.x + self.y * other.y
    }
}

extension CGPoint: CustomStringConvertible {
    public var description: String {
        return "(\(x), \(y))"
    }
}

extension CGPoint {
    public static prefix func + (value: CGPoint) -> CGPoint {
        return value
    }
    
    public static prefix func - (value: CGPoint) -> CGPoint {
        return CGPoint(x: -value.x, y: -value.y)
    }
    
    public static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    public static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    public static func * (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x * rhs.x, y: lhs.y * rhs.y)
    }
    
    public static func * (lhs: CGPoint, rhs: CGFloat) -> CGPoint {
        return CGPoint(x: lhs.x * rhs, y: lhs.y * rhs)
    }
    
    public static func * (lhs: CGFloat, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: rhs.x * lhs, y: rhs.y * lhs)
    }
    
    public static func / (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x / rhs.x, y: lhs.y / rhs.y)
    }
    
    public static func / (lhs: CGPoint, rhs: CGFloat) -> CGPoint {
        return CGPoint(x: lhs.x / rhs, y: lhs.y / rhs)
    }
    
    public static func ⊗ (lhs: CGPoint, rhs: CGAffineTransform) -> CGPoint {
        return lhs.applying(rhs)
    }
    
    public static func += (lhs: inout CGPoint, rhs: CGPoint) {
        lhs = lhs + rhs
    }
    
    public static func -= (lhs: inout CGPoint, rhs: CGPoint) {
        lhs = lhs - rhs
    }
    
    public static func *= (lhs: inout CGPoint, rhs: CGPoint) {
        lhs = lhs * rhs
    }
    
    public static func *= (lhs: inout CGPoint, rhs: CGFloat) {
        lhs = lhs * rhs
    }
    
    public static func /= (lhs: inout CGPoint, rhs: CGPoint) {
        lhs = lhs / rhs
    }
    
    public static func /= (lhs: inout CGPoint, rhs: CGFloat) {
        lhs = lhs / rhs
    }
    
    public static func ⊗= (lhs: inout CGPoint, rhs: CGAffineTransform) {
        lhs = lhs ⊗ rhs
    }
}

extension CGPoint {
    public static func + (lhs: CGPoint, rhs: CGSize) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.width, y: lhs.y + rhs.height)
    }
    
    public static func - (lhs: CGPoint, rhs: CGSize) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.width, y: lhs.y - rhs.height)
    }
    
    public static func * (lhs: CGPoint, rhs: CGSize) -> CGPoint {
        return CGPoint(x: lhs.x * rhs.width, y: lhs.y * rhs.height)
    }
    
    public static func / (lhs: CGPoint, rhs: CGSize) -> CGPoint {
        return CGPoint(x: lhs.x / rhs.width, y: lhs.y / rhs.height)
    }
}

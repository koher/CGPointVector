import CoreGraphics

extension CGSize {
    public func nearlyEqual(to point: CGSize, epsilon: CGFloat) -> Bool {
        let difference = self - point
        return fabs(difference.width) < epsilon && fabs(difference.height) < epsilon
    }
}

extension CGSize: CustomStringConvertible {
    public var description: String {
        return "(\(width), \(height))"
    }
}

public prefix func + (value: CGSize) -> CGSize {
    return value
}

public prefix func - (value: CGSize) -> CGSize {
    return CGSize(width: -value.width, height: -value.height)
}

public func + (left: CGSize, right: CGSize) -> CGSize {
    return CGSize(width: left.width + right.width, height: left.height + right.height)
}

public func - (left: CGSize, right: CGSize) -> CGSize {
    return CGSize(width: left.width - right.width, height: left.height - right.height)
}

public func * (left: CGSize, right: CGAffineTransform) -> CGSize {
    return left.applying(right)
}

public func * (left: CGSize, right: CGFloat) -> CGSize {
    return CGSize(width: left.width * right, height: left.height * right)
}

public func * (left: CGFloat, right: CGSize) -> CGSize {
    return CGSize(width: right.width * left, height: right.height * left)
}

public func / (left: CGSize, right: CGFloat) -> CGSize {
    return CGSize(width: left.width / right, height: left.height / right)
}

public func += (left: inout CGSize, right: CGSize) {
    left = left + right
}

public func -= (left: inout CGSize, right: CGSize) {
    left = left - right
}

public func *= (left: inout CGSize, right: CGFloat) {
    left = left * right
}

public func /= (left: inout CGSize, right: CGFloat) {
    left = left / right
}

public func + (left: CGPoint, right: CGSize) -> CGPoint {
    return CGPoint(x: left.x + right.width, y: left.y + right.height)
}

public func + (left: CGSize, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.width + right.x, y: left.height + right.y)
}

public func - (left: CGPoint, right: CGSize) -> CGPoint {
    return CGPoint(x: left.x - right.width, y: left.y - right.height)
}

public func - (left: CGSize, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.width - right.x, y: left.height - right.y)
}

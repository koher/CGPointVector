import CoreGraphics

extension CGSize: CustomStringConvertible {
    public var description: String {
        return "(\(width), \(height))"
    }
    
    public func nearlyEqualTo(point: CGSize, epsilon: CGFloat) -> Bool {
        let difference = self - point
        return fabs(difference.width) < epsilon && fabs(difference.height) < epsilon
    }
}

public func + (left: CGSize, right: CGSize) -> CGSize {
    return CGSize(width: left.width + right.width, height: left.height + right.height)
}

public func - (left: CGSize, right: CGSize) -> CGSize {
    return CGSize(width: left.width - right.width, height: left.height - right.height)
}

public func * (left: CGSize, right: CGAffineTransform) -> CGSize {
    return CGSizeApplyAffineTransform(left, right)
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

public func == (left: CGSize, right: CGSize) -> Bool {
    return CGSizeEqualToSize(left, right)
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

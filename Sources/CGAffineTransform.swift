import CoreGraphics

extension CGAffineTransform {
    public func nearlyEqualTo(_ transform: CGAffineTransform, epsilon: CGFloat) -> Bool {
        return fabs(a - transform.a) < epsilon && fabs(b - transform.b) < epsilon && fabs(c - transform.c) < epsilon && fabs(d - transform.d) < epsilon && fabs(tx - transform.tx) < epsilon && fabs(ty - transform.ty) < epsilon
    }
    
    public var inverse: CGAffineTransform {
        return self.inverted()
    }
    
    public func isIdentity() -> Bool {
        return self.isIdentity
    }
}

extension CGAffineTransform: CustomStringConvertible {
    public var description: String {
        return "(\(a), \(b), \(c), \(d), \(tx), \(ty))"
    }
}

public func * (left: CGAffineTransform, right: CGAffineTransform) -> CGAffineTransform {
    return left.concatenating(right)
}

public func * (left: CGAffineTransform, right: CGPoint) -> CGPoint {
    return right.applying(left)
}

public func * (left: CGPoint, right: CGAffineTransform) -> CGPoint {
    return left.applying(right)
}

public func *= (left: inout CGAffineTransform, right: CGAffineTransform) {
    left = left * right
}

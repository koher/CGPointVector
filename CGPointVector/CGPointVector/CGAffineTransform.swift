import CoreGraphics

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

extension CGAffineTransform: CustomStringConvertible {
    public var description: String {
        return "(\(a), \(b), \(c), \(d), \(tx), \(ty))"
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

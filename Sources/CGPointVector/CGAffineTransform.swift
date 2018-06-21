import CoreGraphics

extension CGAffineTransform {
    public func nearlyEqual(to transform: CGAffineTransform, epsilon: CGFloat) -> Bool {
        return fabs(a - transform.a) < epsilon && fabs(b - transform.b) < epsilon && fabs(c - transform.c) < epsilon && fabs(d - transform.d) < epsilon && fabs(tx - transform.tx) < epsilon && fabs(ty - transform.ty) < epsilon
    }
    
    public var inverse: CGAffineTransform {
        return self.inverted()
    }
}

extension CGAffineTransform: CustomStringConvertible {
    public var description: String {
        return "(\(a), \(b), \(c), \(d), \(tx), \(ty))"
    }
}

extension CGAffineTransform {
    public static func ⊗ (lhs: CGAffineTransform, rhs: CGAffineTransform) -> CGAffineTransform {
        return lhs.concatenating(rhs)
    }
    
    public static func ⊗= (lhs: inout CGAffineTransform, rhs: CGAffineTransform) {
        lhs = lhs ⊗ rhs
    }
    
    public static func ⊗ (lhs: CGAffineTransform, rhs: CGPoint) -> CGPoint {
        return rhs.applying(lhs)
    }
}

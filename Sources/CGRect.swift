import CoreGraphics

extension CGRect {
    public func nearlyEqualTo(_ rect: CGRect, epsilon: CGFloat) -> Bool {
        let difference1 = self.origin - rect.origin
        let difference2 = (self.origin + self.size) - (rect.origin + rect.size)
        return fabs(difference1.x) < epsilon && fabs(difference1.y) < epsilon
            && fabs(difference2.x) < epsilon && fabs(difference2.y) < epsilon
    }
    
    public var center: CGPoint {
        return CGPoint(x: midX, y: midY)
    }
}

extension CGRect: CustomStringConvertible {
    public var description: String {
        return "(\(origin.description), \(size.description))"
    }
}

public func * (left: CGRect, right: CGAffineTransform) -> CGRect {
    return left.applying(right)
}

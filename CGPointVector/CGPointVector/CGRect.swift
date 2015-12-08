import CoreGraphics

extension CGRect {
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
    return CGRectApplyAffineTransform(left, right)
}

public func == (left: CGRect, right: CGRect) -> Bool {
    return CGRectEqualToRect(left, right)
}

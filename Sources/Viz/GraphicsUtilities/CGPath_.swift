import CoreGraphics

public
extension CGPath {
    // Creating and Managing Paths
    static
    func createMutable() -> CGMutablePath {
        return CGPathCreateMutable()
    }
    
    static
    func createWithEllipseInRect(rect: CGRect, transform: UnsafePointer<CGAffineTransform>) ->  CGPath {
        return CGPathCreateWithEllipseInRect(rect, transform)
    }
    
    static
    func createWithRect(rect: CGRect, transform: UnsafePointer<CGAffineTransform>) -> CGPath {
        return CGPathCreateWithRect(rect, transform)
    }
    
    static
    func createWithRoundedRect(rect: CGRect, cornerWidth: CGFloat, cornerHeight: CGFloat, transform: UnsafePointer<CGAffineTransform>) -> CGPath {
        return CGPathCreateWithRoundedRect(rect, cornerWidth, cornerHeight, transform)
    }
    
    func copy() -> CGPath {
        return CGPathCreateCopy(self)!
    }
    
    func copyByTransformingPath(transform: UnsafePointer<CGAffineTransform>) -> CGPath {
        return CGPathCreateCopyByTransformingPath(self, transform)!
    }
    
    func copyByDashingPath(transform: UnsafePointer<CGAffineTransform>, phase: CGFloat, lengths: [CGFloat]) -> CGPath {
        return CGPathCreateCopyByDashingPath(self, transform, phase, lengths, lengths.count)!
    }
    
    func copyByStrokingPath(transform: UnsafePointer<CGAffineTransform>, lineWidth: CGFloat, lineCap: CGLineCap, lineJoin: CGLineJoin, miterLimit: CGFloat) -> CGPath {
        return CGPathCreateCopyByStrokingPath(self, transform, lineWidth, lineCap, lineJoin, miterLimit)!
    }
    
    func mutableCopy() -> CGMutablePath {
        return CGPathCreateMutableCopy(self)!
    }
    
    func mutablePathByTransformingPath(transform: UnsafePointer<CGAffineTransform>) -> CGMutablePath {
        return CGPathCreateMutableCopyByTransformingPath(self, transform)!
    }
    
    // Modifying Quartz Paths
    func apply(info: UnsafeMutablePointer<Void>, function: CGPathApplierFunction) {
        CGPathApply(self, info, function)
    }
}
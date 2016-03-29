import CoreGraphics

public
extension CGMutablePath {
    // Modifying Quartz Paths
    func addArc(matrix: UnsafePointer<CGAffineTransform>, center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, clockwise: Bool) {
        CGPathAddArc(self, matrix, center.x, center.y, radius, startAngle, endAngle, clockwise)
    }
    
    func addRelativeArc(matrix: UnsafePointer<CGAffineTransform>, center: CGPoint, radius: CGFloat, startAngle: CGFloat, delta: CGFloat) {
        CGPathAddRelativeArc(self, matrix, center.x, center.y, radius, startAngle, delta)
    }
    
    func addArcToPoint(matrix: UnsafePointer<CGAffineTransform>, start: CGPoint, end: CGPoint, radius: CGFloat) {
        CGPathAddArcToPoint(self, matrix, start.x, start.y, end.x, end.y, radius)
    }
    
    func addCurveToPoint(matrix: UnsafePointer<CGAffineTransform>, controlPoint1: CGPoint, controlPoint2: CGPoint, endPoint: CGPoint) {
        CGPathAddCurveToPoint(self, matrix, controlPoint1.x, controlPoint1.y, controlPoint2.x, controlPoint2.y, endPoint.x, endPoint.y)
    }
    
    func addLines(matrix: UnsafePointer<CGAffineTransform>, points: [CGPoint]) {
        CGPathAddLines(self, matrix, points, points.count)
    }
    
    func addLineToPoint(matrix: UnsafePointer<CGAffineTransform>, point: CGPoint) {
        CGPathAddLineToPoint(self, matrix, point.x, point.y)
    }
    
    func addPath(matrix: UnsafePointer<CGAffineTransform>, path: CGPath) {
        CGPathAddPath(self, matrix, path)
    }
    
    func addQuadCurveToPoint(matrix: UnsafePointer<CGAffineTransform>, controlPoint: CGPoint, endPoint: CGPoint) {
        CGPathAddQuadCurveToPoint(self, matrix, controlPoint.x, controlPoint.y, endPoint.x, endPoint.y)
    }
    
    func addRect(matrix: UnsafePointer<CGAffineTransform>, rect: CGRect) {
        CGPathAddRect(self, matrix, rect)
    }
    
    func addRects(matrix: UnsafePointer<CGAffineTransform>, rects: [CGRect]) {
        CGPathAddRects(self, matrix, rects, rects.count)
    }
    
    func addRoundedRect(transform: UnsafePointer<CGAffineTransform>, rect: CGRect, cornerWidth: CGFloat, cornerHeight: CGFloat) {
        CGPathAddRoundedRect(self, transform, rect, cornerWidth, cornerHeight)
    }
    
    func moveToPoint(matrix: UnsafePointer<CGAffineTransform>, point: CGPoint) {
        CGPathMoveToPoint(self, matrix, point.x, point.y)
    }
    
    func close() {
        CGPathCloseSubpath(self)
    }
    
    func addEllipseInRect(matrix: UnsafePointer<CGAffineTransform>, rect: CGRect) {
        CGPathAddEllipseInRect(self, matrix, rect)
    }
}
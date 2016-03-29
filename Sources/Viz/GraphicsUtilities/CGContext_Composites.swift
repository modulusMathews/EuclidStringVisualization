import CoreGraphics

public
extension CGContext {
    func drawRoundedRect(rect: CGRect, radius: CGFloat) {
        let bottomLeft = rect.origin
        let bottomRight = CGPoint(x: rect.maxX, y: rect.minY)
        let topRight = CGPoint(x: rect.maxX, y: rect.maxY)
        let topLeft = CGPoint(x: rect.minX, y: rect.maxY)
        
        let middleLeft = CGPoint(x: rect.minX, y: (bottomLeft.y + topLeft.y) / 2)
        
        moveToPoint(middleLeft)
        
        addArcToPoint(bottomLeft, end: bottomRight, cornerRadius: radius)
        addArcToPoint(bottomRight, end: topRight, cornerRadius: radius)
        addArcToPoint(topRight, end: topLeft, cornerRadius: radius)
        addArcToPoint(topLeft, end: bottomLeft, cornerRadius: radius)
        
        closePath()
    }
}

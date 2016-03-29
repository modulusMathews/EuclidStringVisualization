import CoreGraphics

public
extension CGContext {
    // Saving and Restoring the Current Graphics State
    func saveState() {
        CGContextSaveGState(self)
    }
    
    func restoreState() {
        CGContextRestoreGState(self)
    }
    
    // Getting and Setting Graphics State Parameters
    func setInterpolationQuality(quality: CGInterpolationQuality) {
        CGContextSetInterpolationQuality(self, quality)
    }
    
    func setFlatness(flatness: CGFloat) {
        CGContextSetFlatness(self, flatness)
    }
    
    func setLineCap(cap: CGLineCap) {
        CGContextSetLineCap(self, cap)
    }
    
    func setLineDash(phase: CGFloat, lengths: [CGFloat]) {
        CGContextSetLineDash(self, phase, lengths, lengths.count)
    }
    
    func setLineJoin(join: CGLineJoin) {
        CGContextSetLineJoin(self, join)
    }
    
    func setLineWidth(width: CGFloat) {
        CGContextSetLineWidth(self, width)
    }
    
    func setMiterLength(limit: CGFloat) {
        CGContextSetMiterLimit(self, limit)
    }
    
    func setPatternPhase(phase: CGSize) {
        CGContextSetPatternPhase(self, phase)
    }
    
    func setFillPattern(pattern: CGPattern, components: [CGFloat]) {
        CGContextSetFillPattern(self, pattern, components)
    }
    
    func setRendereringIntent(intent: CGColorRenderingIntent) {
        CGContextSetRenderingIntent(self, intent)
    }
    
    func setShouldAntialias(value: Bool) {
        CGContextSetShouldAntialias(self, value)
    }
    
    func setStrokePattern(pattern: CGPattern, components: [CGFloat]) {
        CGContextSetStrokePattern(self, pattern, components)
    }
    
    func setBlendMode(mode: CGBlendMode) {
        CGContextSetBlendMode(self, mode)
    }
    
    func setAllowsAntialiasing(value: Bool) {
        CGContextSetAllowsAntialiasing(self, value)
    }
    
    
    // Constructing Paths
    func addArc(center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, clockwise: Bool) {
        let clockwiseInt: Int32
        switch clockwise {
        case true: clockwiseInt = 1
        case false: clockwiseInt = 0
        }
        CGContextAddArc(self, center.x, center.y, radius, startAngle, endAngle, clockwiseInt)
    }
    
    func addArcToPoint(start: CGPoint, end: CGPoint, cornerRadius: CGFloat) {
        CGContextAddArcToPoint(self, start.x, start.y, end.x, end.y, cornerRadius)
    }
    
    func addCurveToPoint(controlPoint1: CGPoint, controlPoint2: CGPoint, endPoint: CGPoint) {
        CGContextAddCurveToPoint(self, controlPoint1.x, controlPoint2.y, controlPoint2.x, controlPoint2.y, endPoint.x, endPoint.y)
    }
    
    func addLines(points: [CGPoint]) {
        CGContextAddLines(self, points, points.count)
    }
    
    func addLineToPoint(point: CGPoint) {
        CGContextAddLineToPoint(self, point.x, point.y)
    }
    
    func addPath(path: CGPath) {
        CGContextAddPath(self, path)
    }
    
    func copyPath() -> CGPath? {
        return CGContextCopyPath(self)
    }
    
    func addQuadCurveToPoint(controlPoint: CGPoint, endPoint: CGPoint) {
        CGContextAddQuadCurveToPoint(self, controlPoint.x, controlPoint.y, endPoint.x, endPoint.y)
    }
    
    func addRect(rect: CGRect) {
        CGContextAddRect(self, rect)
    }
    
    func addRects(rects: [CGRect]) {
        CGContextAddRects(self, rects, rects.count)
    }
    
    func beginPath() {
        CGContextBeginPath(self)
    }
    
    func closePath() {
        CGContextClosePath(self)
    }
    
    func moveToPoint(point: CGPoint) {
        CGContextMoveToPoint(self, point.x, point.y)
    }
    
    func addEllipseInRect(rect: CGRect) {
        CGContextAddEllipseInRect(self, rect)
    }
    
    // Painting Paths
    func clearRect(rect: CGRect) {
        CGContextClearRect(self, rect)
    }
    
    func drawPath(mode: CGPathDrawingMode) {
        CGContextDrawPath(self, mode)
    }
    
    func eoFillPath() {
        CGContextEOFillPath(self)
    }
    
    func fillPath() {
        CGContextFillPath(self)
    }
    
    func fillRect(rect: CGRect) {
        CGContextFillRect(self, rect)
    }
    
    func fillRects(rects: [CGRect]) {
        CGContextFillRects(self, rects, rects.count)
    }
    
    func fillEllipseInRect(rect: CGRect) {
        CGContextFillEllipseInRect(self, rect)
    }
    
    func strokePath() {
        CGContextStrokePath(self)
    }
    
    func strokeRect(rect: CGRect) {
        CGContextStrokeRect(self, rect)
    }
    
    func strokeRectWithWidth(rect: CGRect, width: CGFloat) {
        CGContextStrokeRectWithWidth(self, rect, width)
    }
    
    func replacePathWithStrokedPath() {
        CGContextReplacePathWithStrokedPath(self)
    }
    
    func strokeEllipseInRect(rect: CGRect) {
        CGContextStrokeEllipseInRect(self, rect)
    }
    
    func strokeLineSegments(points: [CGPoint]) {
        CGContextStrokeLineSegments(self, points, points.count)
    }
    
    // Getting Information About Paths
    func isPathEmpty() -> Bool {
        return CGContextIsPathEmpty(self)
    }
    
    func getPathCurrentPoint() -> CGPoint {
        return CGContextGetPathCurrentPoint(self)
    }
    
    func getPathBoundingBox() -> CGRect {
        return CGContextGetPathBoundingBox(self)
    }
    
    func pathContainsPoint(point: CGPoint, mode: CGPathDrawingMode) -> Bool {
        return CGContextPathContainsPoint(self, point, mode)
    }
    
    // Modifying Clipping Paths
    func clip() {
        CGContextClip(self)
    }
    
    func eoClip() {
        CGContextEOClip(self)
    }
    
    func clipToRect(rect: CGRect) {
        CGContextClipToRect(self, rect)
    }
    
    func clipToRects(rects: [CGRect]) {
        CGContextClipToRects(self, rects, rects.count)
    }
    
    func getClipBoundingBox() -> CGRect {
        return CGContextGetClipBoundingBox(self)
    }
    
    func clipToMask(rect: CGRect, image: CGImage) {
        CGContextClipToMask(self, rect, image)
    }
    
    // Setting Color, Color Space, and Shadow Values
    func setAlpha(alpha: CGFloat) {
        CGContextSetAlpha(self, alpha)
    }
    
    func setCMYKFillColor(cyan: CGFloat, magenta: CGFloat, yellow: CGFloat, black: CGFloat, alpha: CGFloat) {
        CGContextSetCMYKFillColor(self, cyan, magenta, yellow, black, alpha)
    }
    
    func setFillColor(components: [CGFloat]) {
        CGContextSetFillColor(self, components)
    }
    
    func setCMYKStrokeColor(cyan: CGFloat, magenta: CGFloat, yellow: CGFloat, black: CGFloat, alpha: CGFloat) {
        CGContextSetCMYKStrokeColor(self, cyan, magenta, yellow, black, alpha)
    }
    
    func setFillColorSpace(space: CGColorSpace) {
        CGContextSetFillColorSpace(self, space)
    }
    
    func setFillColorWithColor(color: CGColor) {
        CGContextSetFillColorWithColor(self, color)
    }
    
    func setGrayFillColor(gray: CGFloat, alpha: CGFloat) {
        CGContextSetGrayFillColor(self, gray, alpha)
    }
    
    func setGrayStrokeColor(gray: CGFloat, alpha: CGFloat) {
        CGContextSetGrayStrokeColor(self, gray, alpha)
    }
    
    func setRGBFillColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        CGContextSetRGBFillColor(self, red, green, blue, alpha)
    }
    
    func setRGBStrokeColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        CGContextSetRGBStrokeColor(self, red, green, blue, alpha)
    }
    
    func setShadow(offset: CGSize, blur: CGFloat) {
        CGContextSetShadow(self, offset, blur)
    }
    
    func setShadowWithColor(offset: CGSize, blur: CGFloat, color: CGColor) {
        CGContextSetShadowWithColor(self, offset, blur, color)
    }
    
    func setStrokeColor(components: [CGFloat]) {
        CGContextSetStrokeColor(self, components)
    }
    
    func setStrokeColorSpace(space: CGColorSpace) {
        CGContextSetStrokeColorSpace(self, space)
    }
    
    func setStrokeColorWithColor(color: CGColor) {
        CGContextSetStrokeColorWithColor(self, color)
    }
    
    // Transforming User Space
    func concatCTM(ctm: CGAffineTransform) {
        CGContextConcatCTM(self, ctm)
    }
    
    func getCTM() -> CGAffineTransform {
        return CGContextGetCTM(self)
    }
    
    func rotateCTM(angle: CGFloat) {
        CGContextRotateCTM(self, angle)
    }
    
    func scaleCTM(scaledX: CGFloat, scaledY: CGFloat) {
        CGContextScaleCTM(self, scaledX, scaledY)
    }
    
    func translateCTM(x: CGFloat, y: CGFloat) {
        CGContextTranslateCTM(self, x, y)
    }
    
    
    // Using Transparency Layers
    func beginTransparencyLayer(auxiliaryInfo: CFDictionary) {
        CGContextBeginTransparencyLayer(self, auxiliaryInfo)
    }
    
    func beginTransparencyLayerWithRect(rect: CGRect, auxInfo: CFDictionary) {
        CGContextBeginTransparencyLayerWithRect(self, rect, auxInfo)
    }
    
    func endTransparencyLayer() {
        CGContextEndTransparencyLayer(self)
    }
    
    // Drawing an Image to a Graphics Context
    func drawTiledImage(rect: CGRect, image: CGImage) {
        CGContextDrawTiledImage(self, rect, image)
    }
    
    func drawImage(rect: CGRect, image: CGImage) {
        CGContextDrawImage(self, rect, image)
    }
    
    // Drawing With a Gradient
    func drawLinearGradient(gradient: CGGradient, startPoint: CGPoint, endPoint: CGPoint, options: CGGradientDrawingOptions) {
        CGContextDrawLinearGradient(self, gradient, startPoint, endPoint, options)
    }
    
    func drawRadialGradient(gradient: CGGradient, startCenter: CGPoint, startRadius: CGFloat, endCenter: CGPoint, endRadius: CGFloat, options: CGGradientDrawingOptions) {
        CGContextDrawRadialGradient(self, gradient, startCenter, startRadius, endCenter, endRadius, options)
    }
    
    // Drawing With a Shading
    func drawShading(shading: CGShading) {
        CGContextDrawShading(self, shading)
    }
}
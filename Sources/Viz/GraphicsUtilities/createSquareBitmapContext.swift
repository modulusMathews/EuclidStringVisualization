import Cocoa

public
func createSquareBitmapContext(root: Int) -> CGContext {
    let pixelWidth = root
    let pixelHeight = root
    
    let bitsPerComponent = 32
    
    let bitsPerByte = 8
    let bitsPerPixel = bitsPerComponent * 4
    let bytesPerRow = root * bitsPerPixel / bitsPerByte
    bytesPerRow / 16
    
    let colorSpace =  CGColorSpaceCreateWithName(kCGColorSpaceSRGB)//kCGColorSpaceSRGB
    
    let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.PremultipliedLast.rawValue | CGBitmapInfo.FloatComponents.rawValue)
    
    let result = CGBitmapContextCreate(nil, pixelWidth, pixelHeight, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo.rawValue)!
    result.setShouldAntialias(false)
    return result
}

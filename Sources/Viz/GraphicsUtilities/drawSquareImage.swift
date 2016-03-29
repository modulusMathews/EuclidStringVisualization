import Cocoa

public
func drawSquareImage(root: CGFloat, instruction: (CGContext) -> ()) -> NSImage {
    let imageSize = CGSize(width: root, height: root)
    let image = NSImage(size: imageSize)
    
    image.lockFocus()
    let currentContext = NSGraphicsContext.currentContext()!.CGContext
    instruction(currentContext)
    image.unlockFocus()
    
    return image
}


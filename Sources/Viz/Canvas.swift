import Cocoa

public
extension Color {
    var ns: NSColor {
        return NSColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
    }
    
    var cg: CGColor {
        return ns.CGColor
    }
}

public
enum CanvasBase {
    case Basic(Color)
    case Image(String)
}

public
enum CanvasCommands {
    case Custom((CGContext) -> ())
    case Grid
}

public
enum ColorMap {
    case Custom
    case Com
}

public
struct Canvas {
    public
    init(resolution: Int) {
        self.resolution = resolution
        cornerRadius = 0
        base = .Basic(Color(red: 0, green: 0, blue: 0, alpha: 1)!)
        commands = []
    }
    
    public
    var resolution: Int  {
        didSet {
            if resolution < 1 {
                resolution = oldValue
            }
        }
    }
    
    public
    var size: NSSize {
        return NSSize(width: resolution, height: resolution)
    }
    
    public
    var square: NSRect {
        return NSRect(origin: CGPointZero, size: size)
    }
    
    public
    var cornerRadius: CGFloat {
        didSet {
            if cornerRadius < 0 || cornerRadius > CGFloat(resolution) / 2 {
                cornerRadius = oldValue
            }
        }
    }
    
    public
    var base: CanvasBase
    
    public
    var commands: [CanvasCommands]
    
    public
    var image: NSImage {
        let result = NSImage(size: size)
        
        result.lockFocus()
        
        // Grab Current Context
        let currentContext = NSGraphicsContext.currentContext()!.CGContext
        
        // Draw & Clip Bounds
        currentContext.drawRoundedRect(square, radius: cornerRadius)
        currentContext.clip()
        
        // Draw Base
        switch base {
        case .Basic(let color):
            currentContext.setFillColorWithColor(color.cg)
            currentContext.fillRect(square)
        case .Image(let imageName):
            var tempSquare = square
            let baseImage = NSImage(named: imageName)!
            currentContext.drawImage(tempSquare, image: baseImage.CGImageForProposedRect(&tempSquare, context: nil, hints: nil)!)
        }
        
        // Apply Commands
        for command in commands {
            switch command {
            case .Custom(let customCommand):
                customCommand(currentContext)
            case .Grid:
                break
            }
        }
        
        result.unlockFocus()
        
        return result
    }
}


import Cocoa

public
enum VisOpts {
    case Sing
    case Sym([SymOpts])
    
    public
    enum SymOpts {
        case TopRight
        case BottomRight
        case BottomLeft
        case TopLeft
    }
}

public
func visGrid(context: CGContext, grid: [[Int]], colorMap: [Color], type: VisOpts) {
    let boundingBox = context.getClipBoundingBox()
    let currentRes = boundingBox.maxX
    
    
    let bitmap = createSquareBitmapContext(Int(currentRes))
    
    let cellRoot = currentRes / CGFloat(grid.count)
    
    for (rowIndex, row) in grid.enumerate() {
        for (columnIndex, cell) in row.enumerate() {
            let currentRect = CGRect(x: CGFloat(columnIndex) * cellRoot, y: CGFloat(rowIndex) * cellRoot, width: cellRoot, height: cellRoot)
            if cell == 0 {
                bitmap.setFillColorWithColor(Color(red: 0, green: 0, blue: 0, alpha: 0)!.cg)
            }
            else {
                bitmap.setFillColorWithColor(colorMap[(cell - 1) % colorMap.count].cg)
            }
            
            bitmap.fillRect(currentRect)
        }
    }
    
    let bitmapImage = CGBitmapContextCreateImage(bitmap)!
    
    let mapRect: CGRect
    
    switch type {
    case .Sing:
        mapRect = CGRect(x: 0, y: 0, width: currentRes, height: currentRes)
        context.drawImage(mapRect, image: bitmapImage)
    case .Sym(let quads):
        mapRect = CGRect(x: boundingBox.midX, y: boundingBox.midY, width: boundingBox.midX, height: boundingBox.midY)
        
        for quad in quads {
            context.saveState()
            
            switch quad {
            case .TopRight:
                context.drawImage(mapRect, image: bitmapImage)
            case .BottomRight:
                let flipTransform = CGAffineTransformMake(1, 0, 0, -1, 0, currentRes)
                context.concatCTM(flipTransform)
                context.drawImage(mapRect, image: bitmapImage)
            case .BottomLeft:
                context.translateCTM(boundingBox.maxX, y: boundingBox.maxY)
                context.rotateCTM(CGFloat(M_PI))
                context.drawImage(mapRect, image: bitmapImage)
            case .TopLeft:
                context.translateCTM(currentRes, y: currentRes)
                context.rotateCTM(CGFloat(M_PI))
                let flipTransform = CGAffineTransformMake(1, 0, 0, -1, 0, currentRes)
                context.concatCTM(flipTransform)
                context.drawImage(mapRect, image: bitmapImage)
            }
            context.restoreState()
        }
    }
}

public
enum ColorMapType {
    case Com(Int, Int, Int, Int, Int)
}

public
var alphaCo: Double = 1

public
func genColorMap(type: ColorMapType) -> [Color] {
    var result: [Color] = []
    
    switch type {
    case .Com(let res, let r, let g, let b, let alp):
        let trixx = Trixx_A(resolution: res)!
        
        let redRow = trixx.cells[r - 1]
        let greenRow = trixx.cells[g - 1]
        let blueRow = trixx.cells[b - 1]
        let alphaRow = trixx.cells[alp - 1]
        
        for i in 0..<res {
            let red = Double(redRow[i]) / Double(r)
            let green = Double(greenRow[i]) / Double(g)
            let blue = Double(blueRow[i]) / Double(b)
            let alpha = Double(alphaRow[i]) / Double(alp) * alphaCo
            let newColor = Color(red: red, green: green, blue: blue, alpha: alpha)!
            result.append(newColor)
        }
    }
    
    return result
}
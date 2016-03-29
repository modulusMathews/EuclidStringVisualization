import Cocoa

public
func drawMatrix(context: CGContext, matrix: [[Int]], colorWell: [CGColor], pixelLength: Int) -> CGContext {
    let length = matrix.count
    for (rowIndex, currentRow) in matrix.enumerate() {
        for (columnIndex, currentValue) in currentRow.enumerate() {
            let currentColor: CGColor
            if currentValue == 0 {
                currentColor = NSColor.clearColor().CGColor
            } else {
                currentColor = colorWell[currentValue - 1]
            }
            
            context.setFillColorWithColor(currentColor)
            context.fillRect(CGRect(x: columnIndex * pixelLength / length, y: rowIndex * pixelLength / length, width: pixelLength / length, height: pixelLength / length))
        }
    }
    
    return context
}

public
func generateRGBAColorWell(red: Int, green: Int, blue: Int, alpha: Int, matrix: [[Int]]) -> [CGColor] {
    let redRatios = matrix[red - 1]
    let redMax = CGFloat(redRatios[0])
    let greenRatios = matrix[green - 1]
    let greenMax = CGFloat(greenRatios[0])
    let blueRatios = matrix[blue - 1]
    let blueMax = CGFloat(blueRatios[0])
    let alphaRatios = matrix[alpha - 1]
    let alphaMax = CGFloat(alphaRatios[0])
    
    var result = [CGColor]()
    for currentIndex in 0..<matrix.count {
        let redComp = CGFloat(redRatios[currentIndex]) / redMax
        let greenComp = CGFloat(greenRatios[currentIndex]) / greenMax
        let blueComp = CGFloat(blueRatios[currentIndex]) / blueMax
        let alphaComp = CGFloat(alphaRatios[currentIndex]) / alphaMax
        
        let newColor = NSColor(SRGBRed: redComp, green: greenComp, blue: blueComp, alpha: alphaComp).CGColor
        result.append(newColor)
    }
    return result
}

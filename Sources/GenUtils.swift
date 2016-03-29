import Cocoa


public
func buildSeek(systemRes: Int, _ timeRes: Int, _ timePer: Int, _ spaceRedPer: Int, _ spaceGreenPer: Int, _ spaceBluePer: Int, _ spaceAlphaPer: Int) {
    let coreSpace = Space_A()
    
    coreSpace.resolution = systemRes
    
    let zero = Trixx_A(resolution: timeRes)!
    
    coreSpace.moment.append(zero)
    
    var coreColorMaps: [[Color]] = [genColorMap(.Com(timeRes, spaceRedPer, spaceGreenPer, spaceBluePer, spaceAlphaPer))]
    
    
    /// Time Shit
    let timeEuclid = Euclid(lhs: timePer, rhs: timeRes - timePer)!
    let timeWave = timeEuclid.wave
    let timeIndices = timeWave.indicesOf(true)
    
    var a = Canvas(resolution: timeRes)
    
    a.cornerRadius = CGFloat(a.resolution) / 16
    
    for (sampleIndex, timeIndex) in timeIndices.enumerate() {
        print(sampleIndex)
        a.commands = []
        
        let viz: (CGContext) -> () = {
            alphaCo = 1
            
            let coreGrids = coreSpace.conformed
            
            for (gridIndex, currentGrid) in coreGrids.enumerate() {
                visGrid($0, grid: currentGrid, colorMap: coreColorMaps[gridIndex].rotateBy(timeIndex), type: .Sing)
            }
        }
        
        a.commands.append(.Custom(viz))
        
        let imageData = a.image.TIFFRepresentation!
        
        imageData.writeToFile("\(systemRes)_\(timeRes)_\(timePer)_\(spaceRedPer)_\(spaceGreenPer)_\(spaceBluePer)_\(sampleIndex).tiff", atomically: true)
    }
}

public
func buildSeek_1(spaceResolution spaceResolution: Int, spacePerspective: Int, redPerspective: Int, greenPerspective: Int, bluePerspective: Int, timeResolution: Int, timePerspective: Int) {
    // Build Origin
    let originSpace = Space_A()
    
    originSpace.resolution = spaceResolution
    
    let zero = Trixx_A(resolution: spaceResolution)!
    
    originSpace.moment.append(zero)
    
    let originColorMap = genColorMap(.Com(spaceResolution, redPerspective, greenPerspective, bluePerspective, spacePerspective)).rotateBy(-509)
    
    // Build Initial Canvas
    var canvas = Canvas(resolution: spacePerspective)
    
    canvas.cornerRadius = CGFloat(spacePerspective) / 8
    
    // Time
    let timeEuclid = Euclid(lhs: timePerspective, rhs: timeResolution)!
    let timeWave = timeEuclid.wave
    let timeIndices = timeWave.indicesOf(true)
    
    // Build Time
    for (sampleIndex, timeIndex) in timeIndices.enumerate() {
        print(sampleIndex)
        let viz: (CGContext) -> () = {
            alphaCo = 1
            
            let originGrids = originSpace.conformed
            
            visGrid($0, grid: originGrids[0], colorMap: originColorMap.rotateBy(timeIndex), type: .Sing)
        }
        
        canvas.commands.append(.Custom(viz))
        
        let timeData = canvas.image.TIFFRepresentation!
        
        timeData.writeToFile("\(redPerspective)_\(greenPerspective)_\(bluePerspective)_\(sampleIndex)", atomically: true)
    }
}
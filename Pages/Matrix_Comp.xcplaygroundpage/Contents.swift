import Cocoa
import XCPlayground

XCPSharedDataDirectoryPath
// Declarations
let rootResolution = 1024
let rootPerspective = 1024

    let spaceResolution = rootResolution
    let spacePerspective = rootPerspective

        let pivot = 229

        let redPerspective = 227

        let greenPerspective = 233

        let bluePerspective = 233

    let timeResolution = rootResolution
    let timePerspective = rootPerspective

// Build Origin
let originSpace = Space_A()

originSpace.resolution = spaceResolution

var zero = Trixx_A(resolution: spaceResolution)!
zero.def = .Com(.Composite)

originSpace.moment.append(zero)

let originColorMap = genColorMap(.Com(spaceResolution, redPerspective, greenPerspective, bluePerspective, pivot)).rotateBy(-509)

// Build Initial Canvas
var canvas = Canvas(resolution: 1024)

canvas.cornerRadius = CGFloat(spacePerspective) / 8

// Time
let timeEuclid = Euclid(lhs: timePerspective, rhs: timeResolution)!
let timeWave = timeEuclid.wave
let timeIndices = timeWave.indicesOf(true)


let viz: (CGContext) -> () = {
    alphaCo = 1
        
    let originGrids = originSpace.conformed
        
    visGrid($0, grid: originGrids[0], colorMap: originColorMap, type: .Sing)
}
    
canvas.commands.append(.Custom(viz))

canvas.image

//let canvasData = canvas.image.TIFFRepresentation!

// canvasData.writeToFile("_SMD", atomically: true)


public
protocol Rooted: class {}

public
protocol Timed: Resolute {
    typealias Element
    var moment: [Element] { get }
}

public
protocol Spaced: Rooted, Timed {}

public
class Space_A: Spaced {
    public
    init() {
    }
    
    public
    var resolution: Int = 1 {
        didSet {
            if resolution < 1 {
                resolution = oldValue
            }
        }
    }
    
    public
    var moment: [Trixx_A] = []
}

public
extension Space_A {
    var conformed: [[[Int]]] {
        var result: [[[Int]]] = []
        
        for layer in moment {
            var currentLayer = layer
            
            if currentLayer.resolution != resolution {
                currentLayer.pushMap(resolution, 0, 0)
            }
            
            result.append(currentLayer.form)
        }
        
        return result
    }
}

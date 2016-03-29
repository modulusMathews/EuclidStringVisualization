
public
protocol Wave: Vector {
    var frequency: Int { get }
}

public
extension Wave {
    var wave: [VectorElementType] {
        var result: [VectorElementType] = []
        let currentVector = self.vector
        
        for _ in 0..<frequency {
            result += currentVector
        }
        
        return result
    }
    
    subscript(phase: Int) -> [VectorElementType] {
        get {
            return wave.rotateBy(phase)
        }
    }
}



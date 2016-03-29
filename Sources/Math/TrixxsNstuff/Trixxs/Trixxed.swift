public
enum TrixxType {
    case Com(ComType)
    
    public
    enum ComType {
        case Primitive
        case Composite
    }
}

public
protocol Trixxed: Formed {
    var def: TrixxType { get }
}

public
extension Trixxed {
    var cells: [[Int]] {
        var result: [[Int]] = []
        switch def {
        case .Com(let comType):
            for rowIndex in 1...resolution {
                let currentEuclid: Euclid = Euclid(lhs: rowIndex, rhs: resolution - rowIndex)!
                
                let base: [Bool]
                
                switch comType {
                case .Primitive:
                    base = currentEuclid.vector
                case .Composite:
                    base = currentEuclid.wave
                }
                
                let indices = base.indicesOf(true)
                
                var newRow = [Int](count: base.count, repeatedValue: 0)
                
                for phaseValue in indices {
                    let phased = base.rotateBy(phaseValue)
                    
                    for (currentIndex, currentState) in phased.enumerate() {
                        if currentState {
                            newRow[currentIndex] += 1
                        }
                    }
                }
                
                switch comType {
                case .Primitive:
                    let euclidFrequency = currentEuclid.frequency
                    
                    if euclidFrequency > 1 {
                        var spannedRow: [Int] = []
                        
                        for columnValue in newRow {
                            for _ in 0..<euclidFrequency {
                                spannedRow.append(columnValue)
                            }
                        }
                        
                        result.append(spannedRow)
                    }
                    else {
                        result.append(newRow)
                    }
                case .Composite:
                    result.append(newRow)
                }
            }
        }
        return result
    }
}

public
extension Trixxed {
    var form: [[Int]] {
        var result = cells
        
        for currentFormer in formers {
            switch currentFormer {
            case .Perspective(let orientator):
                switch orientator {
                case .Phase(let x, let y):
                    result = orientator.phase(result, x, y)
                case .Spin(let rotations):
                    result = orientator.spin(result, rotations)
                case .Flip(let flipAxis):
                    result = orientator.flip(result, flipAxis)
                }
            case .Resolution(let mapper):
                switch mapper {
                case .Up(let newRes, let xPhase, let yPhase):
                    result = mapper.up(result, newRes, xPhase, yPhase)
                case .Down(let newRes, let xPhase, let yPhase):
                    result = mapper.down(result, newRes, xPhase, yPhase)
                }
            case .Cells(let converter):
                switch converter {
                case .Sibling:
                    result = converter.sibling(result)
                }
            }
        }
        
        return result
    }
}

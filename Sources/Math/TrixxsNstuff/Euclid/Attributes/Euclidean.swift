
public
protocol Euclidean: Fraction, Wave {}

public
extension Euclidean {
    var frequency: Int {
        if numerator == 0 && denominator == 0 {
            return 0
        }
        return denominator / vector.count
    }
}

private
enum PreRec {
    case Normal
    case InvalidCount
    case Zeroed
    case CountAZero
}

private
extension Euclidean {
    func recGen(elementA: [VectorElementType], _ countA: Int, _ elementB: [VectorElementType], _ countB: Int) -> [VectorElementType] {
        if countB == 0 {
            return elementA
        } else if countA > countB {
            return recGen(elementA, countA - countB, elementA + elementB, countB)
        }
        
        return recGen(elementA + elementB, countA, elementB, countB - countA)
    }
    
    func preRecGen() -> PreRec {
        let currentASize = numerator
        let currentBSize = denominator - numerator
        
        if currentASize  < 0 || currentBSize < 0 {
            return .InvalidCount
        }
        else if currentASize == 0 && currentBSize == 0 {
            return .Zeroed
        }
        else if currentASize == 0 {
            return .CountAZero
        }
        
        return .Normal
    }
}

public
extension Euclidean where VectorElementType: BooleanLiteralConvertible {
    var vector: [VectorElementType] {
        switch preRecGen() {
        case .Normal: break
        case .InvalidCount: return []
        case .Zeroed: return []
        case .CountAZero: return [false]
        }
        
        return recGen([true], numerator, [false], denominator - numerator)
    }
}

public
extension Euclidean where VectorElementType: IntegerLiteralConvertible {
    var vector: [VectorElementType] {
        switch preRecGen() {
        case .Normal: break
        case .InvalidCount: return []
        case .Zeroed: return []
        case .CountAZero: return [0]
        }
        
        return recGen([1], numerator, [0], denominator - numerator)
    }
}

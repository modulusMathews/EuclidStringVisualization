
public
struct Euclid: Euclidean {
    public
    init?(lhs: Int, rhs: Int) {
        if lhs < 0 || rhs < 0 {
            return nil
        }
        
        numerator = lhs
        denominator = lhs + rhs
    }
    
    public
    typealias VectorElementType = Bool
    
    public
    var numerator: Int {
        didSet {
            if numerator < 0 || numerator > denominator {
                numerator = oldValue
            }
        }
    }
    
    public
    var denominator: Int {
        didSet {
            if denominator < numerator {
                denominator = oldValue
            }
        }
    }
}
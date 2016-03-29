
public
protocol Fraction {
    var numerator: Int { get }
    var denominator: Int { get }
}

public
extension Fraction {
    var abstract: Double? {
        if denominator == 0 {
            return nil
        }
        return Double(numerator) / Double(denominator)
    }
}
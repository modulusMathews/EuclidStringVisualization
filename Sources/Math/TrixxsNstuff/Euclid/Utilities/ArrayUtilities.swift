public
extension Array {
    func rotateBy(value: Int) -> [Element] {
        var result: [Element] = []
        
        let startIndex: Int
        
        if(value < 0) {
            let a = abs(value) % count
            
            startIndex = count - a
        }
        else {
            startIndex = value
        }

        for (index, _) in self.enumerate() {
            result += [self[(startIndex + index) % self.count]]
        }
        
        return result
    }
}

public
enum IntervalTypeOption {
    case Sequential
    case Circular
}

public
extension SequenceType where Generator.Element: Equatable {
    func indicesOf(value: Generator.Element) -> [Int] {
        var result: [Int] = []
        
        for (index, val) in self.enumerate() {
            if value == val {
                result.append(Int(index))
            }
        }
        
        return result
    }
    
    func intervalsOf(value: Generator.Element, type: IntervalTypeOption) -> [Int] {
        let size = Int(underestimateCount())
        
        let indices = indicesOf(value)
        
        var result: [Int] = []
        
        for (valueIndex, index) in indices.enumerate() {
            if valueIndex == indices.count - 1 {
                switch type {
                
                case .Sequential: result += [size - index]
                
                case .Circular:
                    let toZero = size - index
                    
                    let fromZero = indices[0]
                    
                    result += [toZero + fromZero]
                }
            }
            else {
                result += [indices[valueIndex + 1] - index]
            }
        }
        
        return result
    }
}

public
extension SequenceType where Generator.Element: BooleanType {
    var strung: String {
        var result = ""
        
        for currentElement in self {
            if currentElement {
                result += "1 "
            }
            else {
                result += "0 "
            }
        }
        
        return result
    }
}


public
extension Array {
    var spaced: String {
        var result = ""
        
        for currentElement in self {
            result += "\(currentElement) "
        }
        
        return result
    }
}

public
func sliceArray(var arr: Array<Int>, x1: Int, x2: Int) -> Array<Int> {
    var tt: Array<Int> = []
    
    for var ii = x1; ii <= x2; ++ii {
        tt.append(arr[ii])
    }
    
    return tt
}

public
func combinations(var arr: Array<Int>, k: Int) -> Array<Array<Int>> {
    var ret: Array<Array<Int>> = []
    
    var sub: Array<Array<Int>> = []
    
    var next: Array<Int> = []
    
    for var i = 0; i < arr.count; ++i {
        if(k == 1){
            ret.append([arr[i]])
        }
        else {
            sub = combinations(sliceArray(arr, x1: i + 1, x2: arr.count - 1), k: k - 1)
            
            for var subI = 0; subI < sub.count; ++subI {
                next = sub[subI]
                
                next.insert(arr[i], atIndex: 0)
                
                ret.append(next)
            }
        }
        
    }
    
    return ret
}



public
enum Transform {
    case Perspective(Orient)
    
    public
    enum Orient {
        case Phase(horizontal: Int, vertical: Int)
        
        public
        func phase(grid: [[Int]], _ x: Int, _ y: Int) -> [[Int]] {
            var result = grid
            if y != 0 {
                result = result.rotateBy(y)
            }
            if x != 0 {
                for (rowIndex, row) in result.enumerate() {
                    result[rowIndex] = row.rotateBy(x)
                }
            }
            return result
        }
        
        
        case Spin(Int)
        
        public
        func spin(grid: [[Int]], _ rotations: Int) -> [[Int]] {
            let currentResolution = grid.count
            var result = grid
            
            for (rowIndex, row) in grid.enumerate() {
                for(columnIndex, cell) in row.enumerate() {
                    let newRowIndex: Int
                    let newColumnIndex: Int
                    
                    switch rotations % 4 {
                    case 1, -3:
                        newRowIndex = currentResolution - 1 - columnIndex
                        newColumnIndex = rowIndex
                    case 2, -2:
                        newRowIndex = currentResolution - 1 - rowIndex
                        newColumnIndex = currentResolution - 1 - columnIndex
                    case 3, -1:
                        newRowIndex = columnIndex
                        newColumnIndex = currentResolution - 1 - rowIndex
                    default:
                        newRowIndex = 0
                        newColumnIndex = 0
                    }
                    
                    result[newRowIndex][newColumnIndex] = cell
                }
            }
            
            return result
        }
        
        
        case Flip(FlipAxis)
        
        public
        enum FlipAxis {
            case Vertical
            case Horizontal
            case Both
        }
        
        public
        func flip(grid: [[Int]], _ axis: FlipAxis) -> [[Int]] {
            let currentResolution = grid.count
            var result = grid
            
            for (rowIndex, rowValue) in grid.enumerate()  {
                let newRowIndex: Int
                
                switch axis {
                case .Vertical, .Both:
                    newRowIndex = currentResolution - rowIndex - 1
                case .Horizontal:
                    newRowIndex = rowIndex
                }
                
                for (columnIndex, columnValue) in rowValue.enumerate() {
                    let newColumnIndex: Int
                    
                    switch axis {
                    case .Horizontal, .Both:
                        newColumnIndex = currentResolution - columnIndex - 1
                    case .Vertical:
                        newColumnIndex = columnIndex
                    }
                    
                    result[newRowIndex][newColumnIndex] = columnValue
                }
            }
            
            return result
        }
    }
    
    
    case Resolution(Map)
    
    public
    enum Map {
        case Up(newRes: Int, xPhase: Int, yPhase: Int)
        
        public
        func up(grid: [[Int]], _ newRes: Int, _ xPhase: Int, _ yPhase: Int) -> [[Int]] {
            let currentResolution = grid.count
            
            if currentResolution == newRes{
                return grid
            }
            
            var result = [[Int]](count: newRes, repeatedValue: [Int](count: newRes, repeatedValue: 0))
            
            let currentEuclid = Euclid(lhs: currentResolution, rhs: newRes - currentResolution)!
            
            let phaseIndices = currentEuclid.wave.indicesOf(true)
            
            let xPhaseIndex = phaseIndices[xPhase % phaseIndices.count]
            let yPhaseIndex = phaseIndices[yPhase % phaseIndices.count]
            
            let xPhased = currentEuclid.wave.rotateBy(xPhaseIndex)
            let yPhased = currentEuclid.wave.rotateBy(yPhaseIndex)
            
            let xPhasedIndices = xPhased.indicesOf(true)
            let yPhasedIndices = yPhased.indicesOf(true)
            
            let xPhasedIntervals = xPhased.intervalsOf(true, type: .Sequential)
            let yPhasedIntervals = yPhased.intervalsOf(true, type: .Sequential)
            
            for (j, rowPivot) in yPhasedIndices.enumerate() {
                for rowOn in 0..<yPhasedIntervals[j] {
                    for (i, columnPivot) in xPhasedIndices.enumerate() {
                        for colOn in 0..<xPhasedIntervals[i] {
                            result[rowPivot + rowOn][columnPivot + colOn] = grid[j][i]
                        }
                    }
                }
            }
            
            return result
        }
        
        case Down(newRes: Int, xPhase: Int, yPhase: Int)
        
        public
        func down(grid: [[Int]], _ newRes: Int, _ xPhase: Int, _ yPhase: Int) -> [[Int]] {
            let currentResolution = grid.count
            
            if currentResolution == newRes {
                return grid
            }
            
            var result = [[Int]](count: newRes, repeatedValue: [Int](count: newRes, repeatedValue: 0))
            
            let currentEuclid = Euclid(lhs: newRes, rhs: currentResolution - newRes)!
            
            let phaseIndices = currentEuclid.wave.indicesOf(true)
            
            let xPhaseIndex = phaseIndices[xPhase % phaseIndices.count]
            let yPhaseIndex = phaseIndices[yPhase % phaseIndices.count]
            
            let xPhased = currentEuclid.wave.rotateBy(xPhaseIndex)
            let yPhased = currentEuclid.wave.rotateBy(yPhaseIndex)
            
            let xPhasedIndices = xPhased.indicesOf(true)
            let yPhasedIndices = yPhased.indicesOf(true)
            
            for (j, rowSampleIndex) in yPhasedIndices.enumerate() {
                for (i, columnSampleIndex) in xPhasedIndices.enumerate() {
                    result[j][i] = grid[rowSampleIndex][columnSampleIndex]
                }
            }
            
            return result
        }
    }
    
    
    case Cells(Convert)
    
    public
    enum Convert {
        case Sibling
        
        public
        func sibling(grid: [[Int]]) -> [[Int]] {
            let currentRes = grid.count
            var result = grid
            for (rowIndex, row) in grid.enumerate() {
                for (columnIndex, cell) in row.enumerate() {
                    let newValue = currentRes - cell
                    result[rowIndex][columnIndex] = newValue
                }
            }
            return result
        }
    }
}

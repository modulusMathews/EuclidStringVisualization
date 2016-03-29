import Cocoa

public
struct Trixx_A: Trixxed {
    public
    init?(resolution: Int) {
        if resolution < 1 {
            return nil
        }
        self.resolution = resolution
        self.def = .Com(.Composite)
        self.formers = []
    }
    
    public
    var resolution: Int  {
        didSet {
            if resolution < 1 {
                resolution = oldValue
            }
        }
    }
    
    public
    var def: TrixxType
    
    private(set)
    public
    var formers: [Transform]
}

let manager = NSFileManager.defaultManager()

public
extension Trixx_A {
    var cells: [[Int]] {
        let path: String
        
        switch def {
        case .Com(let type):
            switch type {
            case .Composite:
                path = NSBundle.mainBundle().pathForResource("\(resolution)", ofType: nil, inDirectory: "Composite")!
            case .Primitive:
                path = NSBundle.mainBundle().pathForResource("\(resolution)", ofType: nil, inDirectory: "Primitive")!
            }
        }
        
        let data = NSData(contentsOfFile: path)!
        var buffer = [Int](count: resolution * resolution, repeatedValue: 0)
        
        data.getBytes(&buffer, length: resolution * resolution * sizeof(Int))
        
        var result: [[Int]] = []
        
        for rowIndex in 0..<resolution {
            var newRow: [Int] = []
            for columnIndex in 0..<resolution {
                newRow.append(buffer[columnIndex + resolution * rowIndex])
            }
            result.append(newRow)
        }
        
        return result
    }
}

public
extension Trixx_A {
    mutating
    func pushPhase(horizontal: Int, _ vertical: Int) {
        let newFormer: Transform = .Perspective(.Phase(horizontal: horizontal, vertical: vertical))
        formers.append(newFormer)
    }
    
    mutating
    func pushSpin(rotations: Int) {
        let newFormer: Transform = .Perspective(.Spin(rotations))
        formers.append(newFormer)
    }
    
    mutating
    func pushFlip(axis: Transform.Orient.FlipAxis) {
        let newFormer: Transform = .Perspective(.Flip(axis))
        formers.append(newFormer)
    }
    
    mutating
    func pushMap(res: Int, _ x: Int, _ y: Int) {
        if res < 1 || x < 0 || y < 0 {
            return
        }
        
        let newFormer: Transform
        switch res {
        case let newRes where newRes < resolution:
            newFormer = .Resolution(.Down(newRes: newRes, xPhase: x, yPhase: y))
        default:
            newFormer = .Resolution(.Up(newRes: res, xPhase: x, yPhase: y))
        }
        formers.append(newFormer)
    }
    
    mutating
    func pushSibling() {
        let newFormer: Transform = .Cells(.Sibling)
        formers.append(newFormer)
    }
    
    mutating
    func popFormer() -> Transform? {
        if formers.isEmpty {
            return nil
        }
        return formers.popLast()
    }
}

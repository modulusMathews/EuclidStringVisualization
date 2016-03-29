
public
struct Color {
    public
    init?(red: Double, green: Double, blue: Double, alpha: Double) {
        self.red = 0
        self.green = 0
        self.blue = 0
        self.alpha = 0
        
        if !validComponent(red) || !validComponent(green) || !validComponent(blue) || !validComponent(alpha) {
            return nil
        }
        
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
    
    public
    var red: Double {
        didSet {
            if !validComponent(red) {
                red = oldValue
            }
        }
    }
    
    public
    var green: Double {
        didSet {
            if !validComponent(green) {
                green = oldValue
            }
        }
    }
    
    public
    var blue: Double {
        didSet {
            if !validComponent(blue) {
                blue = oldValue
            }
        }
    }
    
    public
    var alpha: Double {
        didSet {
            if !validComponent(alpha) {
                alpha = oldValue
            }
        }
    }
    
    public
    var components: [Double] {
        return [red, green, blue, alpha]
    }
    
    private
    func validComponent(component: Double) -> Bool {
        if component < 0 || component > 1 {
            return false
        }
        return true
    }
}

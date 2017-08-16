import Foundation

/**
 * The responsibility of this class is to provide access to the position of the PositionalGraphic
 * NOTE: The if else clauses doesn't look good, but swift doesn't allow setting values via protocols that uses extensions for it's functionality, so its eigther this or implementing implicit setter method in each subclass conforming to IPositional
 * TODO: ⚠️️ Probably use if let in this class
 */
class PositionalDecorator:GraphicDecoratable,Positional{
    var pos:CGPoint{
        get{
            if(decoratable is Positional){return (decoratable as! Positional).pos}
            else{fatalError("Must subclass PositionalGraphic")}
        }
        set{
            if(decoratable is PositionalGraphic){(decoratable as! PositionalGraphic).pos = newValue}
            else if(decoratable is PositionalDecorator){(decoratable as! PositionalDecorator).pos = newValue}
            else{fatalError("Must subclass PositionalGraphic: " + "\(decoratable)")}
        }
    }
    /**
     * NOTE: This method must remain an instance method so that other decorators can override it (Circle, Line, Path, etc)
     */
    func getPosition() -> CGPoint {
        return pos
    }
    func setPosition(_ position: CGPoint) {
        self.pos = position
    }
}

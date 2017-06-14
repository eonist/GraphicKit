import Foundation
/**
 * The responsibility of this class is to provide access to the position of the SizeableGraphic
 * TODO: ⚠️️ Probably use if let in this class
 */
class SizeableDecorator:PositionalDecorator,ISizeable {
    var size:CGSize{
        get{
            //Swift.print("decoratable: " + "\(decoratable)")
            if let decoratable = decoratable as? ISizeable{return decoratable.size}
            else{return CGSize(0,0)/*<- bug fix, GradientSKin needs size to get the trackingArea working was --> *//*fatalError("Must subclass SizeableGraphic")*/}
        }
        set{
            if(decoratable is SizeableGraphic){(decoratable as! SizeableGraphic).size = newValue}//<--this line can be merged with the bellow line, just use as! ISizable
            else if(decoratable is SizeableDecorator){(decoratable as! SizeableDecorator).size = newValue}
            else{fatalError("\(decoratable)" + " must subclass SizeableGraphic")}
        }
    }
    /*
    override func draw() {
        super.draw()
        //graphic.updateTrackingArea(NSRect(pos,size))
    }
    */
    /**
     * NOTE: This method must remain an instance method so that other decorators can override it (Circle, Line, Path, etc)
     */
    func getSize() -> CGSize {
        return size
    }
    func setSizeValue(_ size: CGSize) {
        self.size = size
    }
}

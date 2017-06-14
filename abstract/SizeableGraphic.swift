import Cocoa
/*
 * All SizableGraphics are also positionable
 */
class SizeableGraphic:PositionalGraphic,ISizeable {
    var size:CGSize
    init(_ position:CGPoint, _ size:CGSize, _ decoratable:IGraphicDecoratable = BaseGraphic(FillStyle(NSColor.red))) {//TODO:add the last arg through an extension?
        self.size = size
        super.init(position,decoratable)
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
    func setSizeValue(_ size:CGSize) {/*<- was named setSize, but objc doesnt allow it*/
        self.size = size
    }
}
/**
 * Convenience init methods
 * TODO: Add explination and example code for each init
 */
extension SizeableGraphic{
    /**
     * NOTE: universal initiator for any mix of FillStyle,LineStyle,GradientFillStyle,GradientLineStyle,nil
     * NOTE: one init method that would take IFillStyle and ILineStyle and then make a if decision tree to which Graphic should be created.
     */
    convenience init(_ x:CGFloat,_ y:CGFloat,_ width:CGFloat, _ height:CGFloat,_ fillStyle:IFillStyle? = nil, _ lineStyle:ILineStyle? = nil, _ lineOffset:OffsetType = OffsetType(OffsetType.center)){
        let graphic:IGraphicDecoratable = fillStyle is IGradientFillStyle || lineStyle is IGradientLineStyle ? GradientGraphic(BaseGraphic(fillStyle,lineStyle,lineOffset)) : BaseGraphic(fillStyle,lineStyle,lineOffset)
        self.init(CGPoint(x,y),CGSize(width,height),graphic)
    }
    convenience init(_ x:CGFloat, _ y:CGFloat, _ width:CGFloat,_ height:CGFloat,_ fillColor:NSColor){
        self.init(CGPoint(x,y),CGSize(width,height),BaseGraphic(FillStyle(fillColor)))
    }
    /**
     * TODO: ⚠️️ is this init really needed?
     */
    convenience init(_ width:CGFloat = 100, _ height:CGFloat = 100,_ decoratable:IGraphicDecoratable){
        self.init(CGPoint(0,0),CGSize(width,height),decoratable)
    }
    /**
     * TODO: ⚠️️ I think the two bellow init methods can be merged into one, do it and test explorer if it works
     */
    convenience init(_ width:CGFloat,_ height:CGFloat,_ fillColor:NSColor){
        self.init(CGPoint(0,0),CGSize(width,height),BaseGraphic(FillStyle(fillColor)))
    }
    convenience init(_ width:CGFloat = 100, _ height:CGFloat = 100){
        self.init(CGPoint(0,0),CGSize(width,height))//BaseGraphic(FillStyle(NSColor.redColor())
    }
    convenience init(_ rect:NSRect, _ decoratable: IGraphicDecoratable){
        self.init(rect.origin,rect.size,decoratable)
    }
}

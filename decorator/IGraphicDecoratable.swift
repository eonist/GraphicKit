import Foundation


/**
 * These are the methods the GraphicDecoratable must implement
 * Differs from IBaseGraphic in that IBaseGraphic has some variables that the decoratables isnt dependent on when it comes to the creation procedure
 */
protocol IGraphicDecoratable:class{/*<--Explain why this extends class*/
    func getDecoratable()->IGraphicDecoratable
    var graphic:BaseGraphic{get}
    func getGraphic() -> BaseGraphic/*Don't revert this variable to a protocol*/
    /*Design*/
    func fill()
    func beginFill()
    func drawFill()
    func stylizeFill()
    func line()
    func applyLineStyle()
    func drawLine()
    func stylizeLine()
    func draw()/*Setup the geometry and init the display process of fill and line*/
}
extension IGraphicDecoratable where Self:IPositional, Self:ISizeable{
    var frame:CGRect {return CGRect(self.pos, self.size)}
}
extension IGraphicDecoratable{
    /**
     * NOTE: Returns the actual type! 🎉
     */
    func get<T:IGraphicDecoratable>(_ classType:T.Type) -> T?{
        return DecoratorUtils.decoratable(self, classType) as? T
    }
}
//Size  position
/*
 func getSize()->CGSize
 func getPosition()->CGPoint
 func setSize(size:CGSize)
 func setPosition(position:CGPoint)
 */

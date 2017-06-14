import Foundation

class DecoratorUtils {
    /**
     * Returns a Decorator instance from PARAM: decoratable by Class type PARAM: classType if it exists, if it doesnt it returns nil
     * NOTE: Parses through the hirarchy of decorators to see if there is a match, then returns this match, 
     */
    static func decoratable(_ decoratable:IGraphicDecoratable,_ theClassType:AnyClass)->IGraphicDecoratable? {
        if(Utils.isInstanceOfClass(decoratable, theClassType)) {return decoratable}
        var current:IGraphicDecoratable = decoratable
        while(current.getDecoratable() !== current) {
            if(Utils.isInstanceOfClass(current.getDecoratable(), theClassType)) {return current.getDecoratable()}
            current = current.getDecoratable()
        }
        return nil
    }
    /**
     * Asserts if PARAM: decoratable has a Decorator instance of "Class type" PARAM: classType
     * NOTE: parses throught the hirarchy of decorators to see if there is a match
     */
    static func hasDecoratable(_ decoratable:IGraphicDecoratable,_ classType:AnyClass) -> Bool {
        return DecoratorUtils.decoratable(decoratable, classType) != nil
    }
}
private class Utils{
    /**
     * NOTE: this is a naive way of asserting if an instance of a protocol is a class
     * NOTE: However this method supports...
     */
    static func isInstanceOfClass(_ instanceType:IGraphicDecoratable,_ theClassType:AnyClass)->Bool{
        return "\(theClassType)" == "\(type(of:instanceType))"//swift 3 update
    }
}

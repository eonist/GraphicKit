import Cocoa

extension NSShadow {
    /**
     * ## Examples: let shadow = NSShadow(NSColor.blackColor().alpha(1.0),0.1,0.1,15)
     * ## Examples: let opaqueShadowColor:CGColorRef = CGColorCreateCopyWithAlpha(shadow.shadowColor!.CGColor, 1.0)!/
     */
    convenience init(_ color:NSColor, _ offsetX: CGFloat, _ offsetY: CGFloat, _ blurRadius: CGFloat){
        self.init()
        self.shadowColor = color
        self.shadowOffset = NSMakeSize(offsetX,offsetY)
        self.shadowBlurRadius = blurRadius
    }
}
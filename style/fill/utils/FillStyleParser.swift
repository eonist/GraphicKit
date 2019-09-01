import Foundation

class FillStyleParser {
    /**
     * - Note: You could also add this as a Descrieable extension on the ILineStyle protocol but, its convenient enough to keep it here.
     */
    class func describe(_ fillStyle:FillStyleKind){
        Swift.print("FillStyleParser.describe()")
        Swift.print("fillStyle.color.hex: " + "\(fillStyle.color.hexString)")
        Swift.print("fillStyle.color.alphaComponent: " + "\(fillStyle.color.alphaComponent)")
    }
    /**
     * - Fixme: ⚠️️ Doesn't support GradientFillStyle yet
     */
    class func clone(_ fillStyle: FillStyleKind) -> FillStyleKind {
        return FillStyle(fillStyle.color)
    }
}

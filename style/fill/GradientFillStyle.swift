import Cocoa
/**
 * - Fixme: ⚠️️ ⚠️️ Convert to struct
 */
class GradientFillStyle: FillStyle, GradientFillStyleKind {
    var gradient: GradientKind
    init(_ gradient: GradientKind, _ color: NSColor = .clear){
        self.gradient = gradient
        super.init(color)
    }
}

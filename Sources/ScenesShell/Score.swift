import Igis
import Scenes

class Score: RenderableEntity {
    var rectangle: Rectangle

    init(rect:Rect) {
    //    rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)

        super.init(name:"Score")
    }
    
    override func render(canvas:Canvas) {
        let scoreBoard = Rect(topLeft:Point(x:100, y:50), size:Size(width:200, height:300))

        let strokeStyle = StrokeStyle(color:Color(.orange))
        let strokeStyle = StrokeStyle(color:Color(.red))
        let lineWidth = LineWidth(width:5)
}                                 

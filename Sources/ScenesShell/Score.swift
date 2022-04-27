import Igis
import Scenes

class Score: RenderableEntity {
    

    init(rect:Rect) {
    var rectangle: Rectangle
    var scoreBoard: Rectangle
<<<<<<< HEAD
=======
<<<<<<< HEAD
  //  init() {
=======
    init() {
>>>>>>> 6b8db41eed63939c11cf11190d177e31e3f61d58
>>>>>>> f709227ebb8f4d04875295e42083fa6fec5a4bf4
>>>>>>> eaaf364e1782388aba9671ee30fa824f0485c294
    //    rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)
//        let rectangle = Rect(topLeft:Point(x:100, y:50), size:Size(width:200, height:300))
  //      scoreBoard = Rectangle(rect:rectangle, fillMode:.fillAndStroke)       
     //   super.init()
   // }
    
    override func render(canvas:Canvas) {
        let scoreBoardRect = Rect(topLeft:Point(x:100, y:50), size:Size(width:200, height:300))
        let scoreBoard = Rectangle(rect: scoreBoardRect, fillMode: .fillAndStroke)
        let strokeStyle = StrokeStyle(color:Color(.orange))
        let lineWidth = LineWidth(width:5)
        canvas.render(strokeStyle, lineWidth, scoreBoard)
    }
}

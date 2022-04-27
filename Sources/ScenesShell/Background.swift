import Scenes
import Igis

class Background : RenderableEntity {







    //FUNCS FOR BUILDING BACKGROUND OBJECTS//



    
    init() {
        super.init(name:"Background")
    }

    override func setup(canvasSize: Size, canvas:Canvas){
        let rect = Rect(size:canvasSize)
<<<<<<< HEAD
        let fillColor = FillStyle(color:Color( .white))
        let rectangle = Rectangle(rect: rect, fillMode: .fillAndStroke)
        canvas.render(fillColor, rectangle)
=======
>>>>>>> 6b8db41eed63939c11cf11190d177e31e3f61d58
    }

    override func render(canvas:Canvas){
        let canvasSize = canvas.canvasSize!
    }
}

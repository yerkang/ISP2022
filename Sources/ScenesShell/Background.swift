import Scenes
import Igis

class Background : RenderableEntity {







    //FUNCS FOR BUILDING BACKGROUND OBJECTS//



    
    init() {
        super.init(name:"Background")
    }

    override func setup(canvasSize: Size, canvas:Canvas){
        let rect = Rect(size:canvasSize)
        let fillColor = FillStyle(color:Color( .white))
        let rectangle = Rectangle(rect: rect, fillMode: .fillAndStroke)
        canvas.render(fillColor, rectangle)
    }

    override func render(canvas:Canvas){
        let canvasSize = canvas.canvasSize!
    }
}

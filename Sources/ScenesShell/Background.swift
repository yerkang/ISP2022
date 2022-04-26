import Scenes
import Igis

class Background : RenderableEntity {







    //FUNCS FOR BUILDING BACKGROUND OBJECTS//



    
    init() {
        super.init(name:"Background")
    }

    override func setup(canvasSize: Size, canvas:Canvas){
        rect = Rect(size:canvasSize)
    }

    override func render(canvas:Canvas){
        let canvasSize = canvas.canvasSize!
    }
}

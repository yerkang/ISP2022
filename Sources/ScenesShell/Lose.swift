import Foundation
import Igis
import Scenes

class Lose: RenderableEntity {
    let wides = [80, 50, 90, 170, 290, 50, 170, 100] //building width
    let inBetween = [130, 170, 120, 140, 110, 90, 80] //area in between the buiildings
    
    var lifeCt = 3 //life count (goes down every failed attempt)
    var ind = 0 //index of arrays 

    var lose : Image
    
    init() {
        guard let loseURL = URL(string:"https://o.remove.bg/downloads/93bc81c8-f05e-4329-9adf-4631cbab2a48/istockphoto-1208336101-612x612-removebg-preview.png")
        else {
            fatalError("Failed to create URL for whitehouse")
        }
        lose = Image(sourceURL:loseURL)

        let lifeCt = lifeCt
        // board = Rectangle(rect:rect, fillMode:.fillAndStroke)
        super.init(name: "Lose")
    }

    func renderLife (canvas:Canvas, lifeCt:Int) { //renders number of lives left
        let text = Text(location:Point(x:15, y:40), text:"Number of Lives: \(lifeCt)")
        text.font = "30pt Arial"

        let instr1 = Text(location:Point(x:15, y: 80), text:"press [X] to extend bridge; press [F] to drop bridge")
        instr1.font = "20pt Arial"
        canvas.render(FillStyle(color:Color(.black)))
        canvas.render(text, instr1)
    }

    override func setup(canvasSize:Size, canvas:Canvas) {
        canvas.setup(lose)
    }

    func loseLife () { //lose 1 life
        lifeCt -= 1
    }

    func renderRectangle(canvas: Canvas, rect: Rect, color:Color){ //for ez rendering of rects
        let rectangle = Rectangle(rect: rect, fillMode: .fillAndStroke)
        let fillRect = FillStyle(color:color)
        canvas.render(fillRect, rectangle)
    }
    

    override func render(canvas:Canvas) {
        let canvasSize = canvas.canvasSize!
        let blackOut = Rect(topLeft:Point(x:0, y:0), size: canvasSize)

        if lifeCt == 0 {
            renderRectangle(canvas:canvas, rect:blackOut, color: Color(.black)) //makes the entire screen black

            let dead = Text(location:Point(x:canvasSize.width/3, y:canvasSize.height/2), text:"YOU DIED!!! :(") //text that showes when you die
            let dead2 = Text(location:Point(x:canvasSize.width/3, y:3*(canvasSize.height/4)), text:"Refresh the Page to RESTART")
            dead.font = "30pt Arial"
            canvas.render(FillStyle(color:Color(.white)))
            canvas.render(dead, dead2)
        }
        renderLife(canvas:canvas, lifeCt: lifeCt) //renders the number of lives (see func)
    }
}

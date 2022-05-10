import Foundation
import Igis
import Scenes

class Lose: RenderableEntity {
    let wides = [80, 50, 90, 170, 290, 50, 170, 100] //building width
    let inBetween = [130, 170, 120, 140, 110, 90, 80] //area in between the buiildings
    
    var winCt = 0 //how many successful bridges
    var lifeCt = 3 //life count (goes down every failed attempt)
    var ind = 0 //index of arrays 

    init() {
        super.init(name: "Lose")
    }

    func renderLife (canvas:Canvas, lifeCt:Int) { //renders number of lives left
        let text = Text(location:Point(x:15, y:40), text:"Number of Lives: \(lifeCt)")
        text.font = "30pt Courier New"

        let instr1 = Text(location:Point(x:15, y: 80), text:"press [X] to extend bridge; press [F] to drop bridge")
        instr1.font = "20pt Courier New"
        canvas.render(FillStyle(color:Color(.black)))
        canvas.render(text, instr1)
    }


    func loseLife () { //lose 1 life
        lifeCt -= 1
    }
    func winUp () { //one closer to win
        winCt += 1
    }

    func renderRectangle(canvas: Canvas, rect: Rect, color:Color){ //for ez rendering of rects
        let rectangle = Rectangle(rect: rect, fillMode: .fillAndStroke)
        let fillRect = FillStyle(color:color)
        canvas.render(fillRect, rectangle)
    }
    

    override func render(canvas:Canvas) {
        let canvasSize = canvas.canvasSize!
        let blackOut = Rect(topLeft:Point(x:0, y:0), size: canvasSize)

        renderLife(canvas:canvas, lifeCt: lifeCt) //renders the number of lives (see func)        

        if lifeCt == 0 {
            renderRectangle(canvas:canvas, rect:blackOut, color: Color(.black)) //makes the entire screen black
            let dead = Text(location:Point(x:canvasSize.width/3, y:canvasSize.height/2), text:"YOU DIED!!! ･ﾟ･(｡>ω<｡)･ﾟ･") //text that showes when you die
            let dead2 = Text(location:Point(x:canvasSize.width/3, y:3*(canvasSize.height/5)), text:"Refresh the Page to RESTART")
            dead.font = "30pt Courier New"
            canvas.render(FillStyle(color:Color(.white)))
            canvas.render(dead, dead2)
        }

        if winCt == 6 {
            renderRectangle(canvas:canvas, rect: blackOut, color: Color(.lightpink))
            let win = Text(location:Point(x:canvasSize.width/3, y:canvasSize.height/2), text:"YOU WIN!! CONGRATS!!! °˖✧◝(⁰▿⁰)◜✧˖°")
            win.font = "30pt Georgia"            
            let win2 = Text(location:Point(x:canvasSize.width/3, y:3*(canvasSize.height/5)), text:"Lives left: \(lifeCt)")            
            win2.font = "30pt Georgia" 
            canvas.render(FillStyle(color:Color(.black)), win)
        }


    }
}

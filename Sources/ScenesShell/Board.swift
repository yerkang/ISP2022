import Igis
import Scenes
import Foundation

class Board: RenderableEntity {
    var board: Rectangle 
    var height = 5
    
    init(rect: Rect){
        board = Rectangle(rect:rect, fillMode:.fillAndStroke)  
        super.init(name: "Board")
    }
    
    override func render(canvas:Canvas) {
        let strokeStyle = StrokeStyle(color:Color(.black))
        let fillStyle = FillStyle(color:Color(.white))
        let lineWidth = LineWidth(width:1)
        canvas.render(strokeStyle, fillStyle, lineWidth, board)

    }

    func move(to point:Point) {
        board.rect.topLeft = point
    } // initial point of rect




    func extend(height: Int) {
        board.rect.size.height -= height } // func called in interaction to increase board height

    func fall() {
        let x =  board.rect.size.height
        board.rect.size.height = board.rect.size.width
        board.rect.size.width = x*(-1) }

  //  func gameOver() {
  //  }

   
        
    
    func calculate(widthBetween: [Int], widthOf: [Int], n: Int) { // only called after f is held down

        var x = n
      
       
        if board.rect.size.width  > (widthOf[x+1]/2) + widthBetween[x] + widthOf[x+2] { // n is index
            board.rect.size.height = 100   

        }


        if board.rect.size.width  < (widthOf[x+1]/2) + widthBetween[x]  {
    

            board.rect.size.height = 50
            // dude never makes it - falls off
        }

        let endRange = (widthOf[x+1]/2) + widthBetween[x] + widthOf[x+2]
        let startRange = (widthOf[x+1]/2) + widthBetween[x]
        let newPosition = (widthOf[x+1]/2) + widthBetween[x] + (widthOf[x+2]/2)
        
        if board.rect.size.width < endRange && board.rect.size.width > startRange  {

            board.rect.topLeft.x += newPosition
            board.rect.size.width = 10
            board.rect.size.height = -10

    func fall() {
        let x =  board.rect.size.height
        board.rect.size.height = board.rect.size.width
        board.rect.size.width = x*(-1) }


    func calculate(canvas: Canvas, widthBetween: [Int], widthOf: [Int], n: Int) { // only called after f is held down


        let adds = [width/15, width/13, width/12, width/10, width/11, width/5, width/9, width/15, width/17] // distance between        

        canvasSize = canvas.canvasSize!
        let width = canvasSize.width
        

    }

    func calculate(widthBetween: [Int], widthOf: [Int], n: Int) { // only called after f is held down

        let adds = [130, 170, 120, 140, 110, 90, 150, 160, 175, 80]     



        

        if board.rect.size.width > (widthOf[n]/2) + widthBetween[n] + widthOf[n+1] { // n is index
            board.rect.size.width = 0
        }

        if board.rect.size.width < (widthOf[n]/2) + widthBetween[n] {

            board.rect.size.width = 0

           board.rect.size.width = 0

            // dude never makes it - falls off
        }
        
        let startRange = (widthOf[n]/2) + widthBetween[n]
        let endRange = (widthOf[n]/2) + widthBetween[n] + widthOf[n+1]

        if endRange >= startRange {
        let numberRange = startRange...endRange
        }
        
        if numberRange.contains(board.rect.size.width) {
            board.rect.size.width += 40
        }
        
     
        
        
        if board.rect.size.width > startRange && board.rect.size.width < endRange {
           board.rect.size.width += 40

            // dude walks over
        }

    }        
        
            
        



            x += 1
            // dude walks over
        }

    
        
    }
    


} // board falling graphic - called in interaction







}


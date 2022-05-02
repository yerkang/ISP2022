import Scenes
import Igis

  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity, MouseMoveHandler {
    func renderRectangle(canvas: Canvas, rect: Rect, color:Color){
        let rectangle = Rectangle(rect: rect, fillMode: .fillAndStroke)
        let fillRect = FillStyle(color:color)
        canvas.render(fillRect, rectangle)
    }
    
    func renderWindows(canvas: Canvas, rect: Rect, columns: Int, rows: Int) {
        var wind = rect
        let spaceBt = wind.size.width + 10
        for _ in 0 ..< rows {
            for _ in 0 ..< columns {
                let  rand = Int.random(in: 1 ... 20)
                if rand % 3 == 0 {
                    renderRectangle(canvas:canvas, rect:wind, color: Color(red:255, green: 214, blue:10))
                    wind.topLeft.x += spaceBt
                } else if rand % 3 != 0{ 
                    renderRectangle(canvas:canvas, rect:wind, color: Color(red:44, green: 44, blue:46))
                    wind.topLeft.x += spaceBt
                }
            }
            wind.topLeft.x -= spaceBt * columns
            wind.topLeft.y += wind.size.height + 10
        }
    }


    func renderTower (canvas:Canvas, rect: Rect, towerCt: Int, color: Color, adds: [Int]){
        var tower = rect
        var winds = Rect(topLeft:Point(x:rect.topLeft.x+10, y:rect.topLeft.y+10), size:Size(width: 30, height: 10))
        var ind = 0 
        for _ in 0 ..< towerCt {
            let add = adds[ind]
            if add % 3 == 0 {
                tower.size.height -= add
                tower.topLeft.y += add
                renderRectangle(canvas:canvas, rect:tower, color:color)
                winds.topLeft.y += add
            } else {
                tower.size.height += add
                tower.topLeft.y -= add
                renderRectangle(canvas:canvas, rect:tower, color:color)
                winds.topLeft.y -= add               
            }
            ind = (ind + 1) % towerCt
            let space = tower.size.width + 30
            renderWindows(canvas:canvas, rect:winds, columns: tower.size.width / 40, rows: tower.size.height / 25)
            tower.topLeft.x += space
            winds.topLeft.x += space

        }
    }

    func renderCloud (canvas:Canvas, x: Int, y:Int) {
        var lump1 = Ellipse(center:Point(x:x, y:y), radiusX:50, radiusY:50, fillMode: .fill)
        var lump2 = Ellipse(center:Point(x:x+50, y:(y)+25), radiusX:50, radiusY:50, fillMode: .fill)
        var lump3 = Ellipse(center:Point(x:x-50, y:(y)+25), radiusX:50, radiusY:50, fillMode: .fill)
        let cloudCl = FillStyle(color:Color(.white)) ; canvas.render(cloudCl, lump1, lump2, lump3)
    }

    var  move = true
    var rect: Rect?
    var cloudM = 0
      init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Background")
      }

      override func setup(canvasSize: Size, canvas: Canvas) {
          dispatcher.registerMouseMoveHandler(handler:self)
          rect = Rect(size:canvasSize)
      }

      let towerNo = Int.random(in:2...5)
      override func render(canvas:Canvas){

          let canvasSize = canvas.canvasSize!
          let sky = Rect(topLeft:Point(x:0, y:0), size:canvasSize)
          let skyRect = Rectangle(rect:sky, fillMode:.fill)
          let skyClr = FillStyle(color:Color(red:128, green:170, blue:255))

          let groundRect = Rect(topLeft:Point(x:0, y:0 + (2*(canvasSize.height/3))), size:Size(width: canvasSize.width, height: canvasSize.height/3))
          let ground = Rectangle(rect: groundRect, fillMode: .fill)
          let groundClr = FillStyle(color:Color(red:119, green:179, blue:0))
          canvas.render(skyClr, skyRect, groundClr, ground)
              
          let towerStr = StrokeStyle(color:Color(.black)); let towerW = LineWidth(width:1);  canvas.render(towerStr, towerW)
          let towerRect = Rect(topLeft:Point(x:50, y: 2*(canvasSize.height/3)-300), size: Size(width: 100, height:300))
          renderTower(canvas:canvas, rect: towerRect, towerCt: towerNo, color: Color(.gray), adds: [25, 30, 13, 22, 42])


   
       

      


          renderCloud(canvas:canvas, x:cloudM, y:canvasSize.height/3)
          cloudM += 10

          }                  
    
      func onMouseMove(globalLocation: Point, movement: Point){
      }
      override func teardown() {
          dispatcher.unregisterMouseMoveHandler(handler:self)
      }
}

      

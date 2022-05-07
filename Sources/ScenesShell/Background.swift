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





    func renderTower (canvas:Canvas, rect: Rect, towerCt: Int, color: Color, adds: [Int], widthAds: [Int]){
        var tower = rect
        var ind = 0
        var winds = Rect(topLeft:Point(x:rect.topLeft.x+10, y:rect.topLeft.y+10), size:Size(width: 30, height: 10))



      

        for _ in 0 ..< towerCt {
            let add = adds[ind]
            let widthAd = widthAds[ind]
            ind = (ind+1)%adds.count
            tower.size.width = widthAd // changing width of tower
            renderRectangle(canvas:canvas, rect:tower, color:color)
            let space = tower.size.width + add // changing distance between towers
            renderWindows(canvas:canvas, rect:winds, columns: tower.size.width / 40, rows: tower.size.height / 25)
            tower.topLeft.x += space
            winds.topLeft.x += space
            


        }


        
    }




    }
    
    func renderCloud (canvas:Canvas, x: Int, y:Int) {
        let  lump1 = Ellipse(center:Point(x:x, y:y), radiusX:50, radiusY:50, fillMode: .fill)
        let lump2 = Ellipse(center:Point(x:x+50, y:(y)+25), radiusX:50, radiusY:50, fillMode: .fill)
        let lump3 = Ellipse(center:Point(x:x-50, y:(y)+25), radiusX:50, radiusY:50, fillMode: .fill)
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

      override func render(canvas:Canvas){
          let canvasSize = canvas.canvasSize!
          let width = canvasSize.width

          let sky = Rect(topLeft:Point(x:0, y:0), size:canvasSize)
          let skyRect = Rectangle(rect:sky, fillMode:.fill)
          let skyClr = FillStyle(color:Color(red:128, green:170, blue:255))


          let groundRect = Rect(topLeft:Point(x:0, y:0 + (5*(canvasSize.height/6))), size:Size(width: width, height: canvasSize.height/3))

          let groundRect = Rect(topLeft:Point(x:0, y:0 + (5*(canvasSize.height/6))), size:Size(width: width, height: canvasSize.height/6))

          let ground = Rectangle(rect: groundRect, fillMode: .fill)
          let groundClr = FillStyle(color:Color(red:119, green:179, blue:0))
          canvas.render(skyClr, skyRect, groundClr, ground)


          let wides = [50, 90, 170, 290, 50, 170, 140, 240, 170, 250, 50, 170] // tower width increment
          let inBetween = [130, 170, 120, 140, 110, 90, 150, 160, 175, 80]     
          let towerNo = width/(width/7)

          let towerStr = StrokeStyle(color:Color(.black)); let towerW = LineWidth(width:1);  canvas.render(towerStr, towerW)
          let towerRect = Rect(topLeft:Point(x:80, y: 5*(canvasSize.height/6)-300), size: Size(width: 150, height:300))
          renderTower(canvas:canvas, rect: towerRect, towerCt: towerNo, color: Color(.gray), adds: inBetween, widthAds: wides) // distance between

          let wides = [-50, 35, 10, -5, 10, 20, -10, 30, -10, 15, 20, -15] // tower width increment
          let twrWidth = [width/15, width/13, width/12, width/10, width/11, width/5, width/9, width/15, width/17]

          let towerNo = width/(width/7)
          
          let towerStr = StrokeStyle(color:Color(.black)); let towerW = LineWidth(width:1);  canvas.render(towerStr, towerW)
          let towerRect = Rect(topLeft:Point(x:80, y: 5*(canvasSize.height/6)-300), size: Size(width: 150, height:300))
          renderTower(canvas:canvas, rect: towerRect, towerCt: towerNo, color: Color(.gray), adds:twrWidth, widthAds: wides) // distance between 


          renderCloud(canvas:canvas, x:cloudM, y:canvasSize.height/4)
          if cloudM > width+100 {
              cloudM = 0
          }

          cloudM += 10

      }
      

          cloudM += 10          

      }
    

      func onMouseMove(globalLocation: Point, movement: Point){
      }
      override func teardown() {
          dispatcher.unregisterMouseMoveHandler(handler:self)
      }
}


      

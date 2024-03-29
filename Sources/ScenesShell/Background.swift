import Scenes
import Igis
import Foundation

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
    
    var  move = true
    var rect: Rect?
    var cloudM = 0

    var cloud : Image
    
    init() {
        guard let cloudURL = URL(string:"https://www.pikpng.com/pngl/b/472-4723400_clouds-transparent-pixel-art-clouds-clipart.png")
        else {
            fatalError("Failed to create URL for cloud")
        }
        cloud = Image(sourceURL:cloudURL)
        
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Background")
    }

    override func setup(canvasSize: Size, canvas: Canvas) {
        dispatcher.registerMouseMoveHandler(handler:self)
        rect = Rect(size:canvasSize)

        canvas.setup(cloud)
        
      }

      override func render(canvas:Canvas){
          let canvasSize = canvas.canvasSize!
          let width = canvasSize.width

          let sky = Rect(topLeft:Point(x:0, y:0), size:canvasSize)
          let skyRect = Rectangle(rect:sky, fillMode:.fill)
          let skyClr = FillStyle(color:Color(red:128, green:170, blue:255))          

          let groundRect = Rect(topLeft:Point(x:0, y:0 + (5*(canvasSize.height/6))), size:Size(width: width, height: canvasSize.height/3))
          let ground = Rectangle(rect: groundRect, fillMode: .fill)
          let groundClr = FillStyle(color:Color(red:119, green:179, blue:0))
          canvas.render(skyClr, skyRect, groundClr, ground)

          let wides = [80, 50, 90, 170, 290, 50, 170, 100] //building width
          let inBetween = [130, 170, 120, 140, 110, 90, 80] //area in between the buiildings
          let towerNo = 7

          if cloud.isReady {
              let sourceRect = Rect(topLeft:Point(x:00, y:00), size:Size(width:1400, height:800))
              let destinationRect = Rect(topLeft:Point(x:cloudM, y:100), size:Size(width:400, height:250))
              cloud.renderMode = .sourceAndDestination(sourceRect:sourceRect, destinationRect:destinationRect)
              canvas.render(cloud)              
          }          

          let towerStr = StrokeStyle(color:Color(.black)); let towerW = LineWidth(width:1);  canvas.render(towerStr, towerW)
          let towerRect = Rect(topLeft:Point(x:80, y: 5*(canvasSize.height/6)-300), size: Size(width: 150, height:300))
          renderTower(canvas:canvas, rect: towerRect, towerCt: towerNo, color: Color(.gray), adds: inBetween, widthAds: wides) // distance between

          cloudM += 5

          if cloudM > canvasSize.width {
              cloudM = 0
          }
              
      }
              
      func onMouseMove(globalLocation: Point, movement: Point){
      }
      override func teardown() {
          dispatcher.unregisterMouseMoveHandler(handler:self)
      }
}


      

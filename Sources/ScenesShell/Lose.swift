import Foundation
import Igis
import Scenes

class Lose: RenderableEntity {
    var lose : Image

    init() {
        guard let loseURL = URL(string:"http://pixelartmaker-data-78746291193.nyc3.digitaloceanspaces.com/image/998c2fe51b48b9e.png")
        else {
            fatalError("Failed to create URL for whitehouse")
        }
        lose = Image(sourceURL:loseURL)
        // board = Rectangle(rect:rect, fillMode:.fillAndStroke)
        super.init(name: "Lose")
    }

    override func setup(canvasSize:Size, canvas:Canvas) {
        canvas.setup(lose)
    }

    override func render(canvas:Canvas) {
        if lose.isReady {
            let lsourceRect = Rect(topLeft:Point(x:00, y:00), size:Size(width:500, height:500))
            let ldestinationRect = Rect(topLeft:Point(x:200, y:800), size:Size(width:200, height:200))
            lose.renderMode = .sourceAndDestination(sourceRect:lsourceRect, destinationRect:ldestinationRect)
            canvas.render(lose)
        }
    }
}

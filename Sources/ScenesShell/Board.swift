class Board: RenderableEntity {
    var rectangle : Rectangle

    init(rect:Rect) {
        rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)
        super.init(name: "Board")
    }

    override func render(canvas:Canvas) {
        let strokeStyle = StrokeStyle(color:Color(.black))
        let fillStyle = FillStyle(color:Color(.white))
        let lineWidth = LineWidth(width:2)
        canvas.render(strokeStyle, fillStyle, lineWidth, rectangle)
    }

}

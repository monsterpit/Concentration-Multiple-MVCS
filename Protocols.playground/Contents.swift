import UIKit
var str = "Hello, playground"

protocol Moveable{
    mutating func move(to point : CGPoint)
}

class Car : Moveable{
    func move(to point : CGPoint){print("moved car to \(point)")}
    func changeOil(){}
}

struct Shape : Moveable{
    mutating func move(to point: CGPoint) {
        print("moved square to \(point)")
    }
    func draw(){}
}

var prius : Car = Car()
var square : Shape = Shape()

var thingToMove : Moveable = prius
thingToMove.move(to: CGPoint(x: 5, y: 5))
//moved car to (5.0, 5.0)


//thingToMove.changeOil()
//error: Protocols.playground:26:1: error: value of type 'Moveable' has no member 'changeOil'
//Cant do this as it is a Movable Object and not Car

thingToMove = square

let thingToMove2 : [Moveable] = [prius,square]

//func slide(slider : Moveable){
//    let positionToSlideTo = CGPoint(x: 5, y: 5)
//    slider.move(to: positionToSlideTo)
//}
//
//slide(slider: prius)
//slide(slider: square)

protocol Slippery{
    
}

// A func can have 2 protocols using &
func slipAndSlide(x:Slippery & Moveable){
    
}

//slipAndSlide(x: prius)
//error becuase prius is only Moveable and not slippery

//
//  dummy.swift
//  menuUI
//
//  Created by Michelle Alexandra on 02/11/22.
//

import SwiftUI

// https://betterprogramming.pub/wheel-picker-view-in-swiftui-6de7077b4791
struct myVal: Equatable {
    let id = UUID()
    let val: String
}

enum Direction {
    case left
    case right
}

struct WheelView: View {
    // Circle Radius
    @State var radius: Double = 150
    // Direction of swipe
    @State var direction = Direction.left
    // index of the number at the bottom of the circle
    @State var chosenIndex = 3
    // degree of circle and hue
    @Binding var degree: Double
    @State var lastDegree: Double?
//    @State var degree = 90.0
    let array: [myVal]
    let circleSize: Double

    @State var startLocation: CGPoint?

    func moveWheel() {
        withAnimation(.spring()) {
            if direction == .left {
                degree += Double(360 / array.count)
                if chosenIndex == 0 {
                    chosenIndex = array.count - 1
                } else {
                    chosenIndex -= 1
                }
            } else {
                degree -= Double(360 / array.count)
                if chosenIndex == array.count - 1 {
                    chosenIndex = 0
                } else {
                    chosenIndex += 1
                }
            }
        }
    }

    var body: some View {
        ZStack {
            let anglePerCount = Double.pi * 2.0 / Double(array.count)
            let drag = DragGesture()
                .onChanged { v in
                    var theta = (atan2(v.location.x - circleSize / 2, circleSize / 2 - v.location.y) - atan2(v.startLocation.x - circleSize / 2, circleSize / 2 - v.startLocation.y)) * 180 / .pi
                    if theta < 0 { theta += 360 }
                    degree = theta + (lastDegree ?? 0)
                    
                    if degree > 360 { degree -= 360 }
                    
                    print("degree", degree)
                }
                .onEnded { _ in
                    lastDegree = self.degree
                    
                    let itemAngle = Double(360 / array.count)
                    let unparsed = (lastDegree! / itemAngle).rounded()
                    let value = unparsed == 12 ? 0 : unparsed
                    // kalo 12 = 0
                    let end = Int(value) + 6 > 12 ? Int(value) - 6 : Int(value) + 6
                    
                    chosenIndex = 12 - end
                    
                
                        degree = -(Double(chosenIndex - 6) * itemAngle)
                
                    print("last degree",chosenIndex)
                }
//                .onEnded { value in
//
//                        print("onEnd", degree)
            ////                    let selected = Int(degree / Double(anglePerCount))
            ////                    print("selected: ", selected)
//
            ////                    print("Y POS", value.location.y)
            ////
            ////                    if value.startLocation.x > value.location.x + 10 {
            //////                        print("leftDirection", value.location.y)
            ////                        direction = .left
            ////                    } else if value.startLocation.x < value.location.x - 10 {
            //////                        print("rightDirection", value.location.y)
            ////                        direction = .right
            ////                    }
            ////                    moveWheel()
//                }

            // MARK: WHEEL STACK - BEGINNING

            ZStack {
//                Circle().fill(EllipticalGradient(colors: [.orange,.yellow]))
//                    .hueRotation(Angle(degrees: degree))

                ForEach(0 ..< array.count) { index in
                    let angle = Double(index) * anglePerCount
                    let xOffset = CGFloat(radius * cos(angle))
                    let yOffset = CGFloat(radius * sin(angle))

                    ZStack {
                        Image("story").resizable().scaledToFit().frame(width: chosenIndex == index ? 130 : 90)
                        Text("\(index)")
                    }
                    .rotationEffect(Angle(degrees: -degree))
                    .offset(x: xOffset, y: yOffset)
                    .grayscale(chosenIndex == index ? Double(0) * 0.1999 : Double(5) * 0.1999)
//                        .onTapGesture {
//                            withAnimation(.spring()) {
//                                let difference = chosenIndex - index
//                                chosenIndex = index
//                                degree += Double(difference) * Double(360/array.count)
//                            }
//                        }
                }
            }
            .rotationEffect(Angle(degrees: degree))
            .gesture(drag)
            .onAppear {
                radius = circleSize / 1.85 // 20 is for padding
            }

            // MARK: WHEEL STACK - END
        }
        .frame(width: circleSize, height: circleSize)
    }
}

//
//  DragGestureBootcamp.swift
//  ContinuedLearning
//
//  Created by Andres camilo Raigoza misas on 9/12/21.
//

import SwiftUI

struct DragGestureBootcamp: View {
    
    @State var offSet: CGSize = .zero
    
    var body: some View {
        ZStack {
            
            VStack {
                Text("\(offSet.width)")
                Spacer()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 500)
                .offset(offSet)
                .scaleEffect(getScaleAmount())
                .rotationEffect(Angle(degrees: getRotationAmount()))
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            print("Drag gesture value: \(value.translation)")
                            withAnimation(.spring()) {
                                offSet = value.translation
                            }
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                //offSet = CGSize(width: 0, height: 0)
                                offSet = .zero
                            }
                        }
            )
        }
    }
    
    func getScaleAmount() -> CGFloat {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = abs(offSet.width)
        let percentage = currentAmount / max
        let minScale = min(percentage, 0.5) * 0.5
        print("min scale: \(minScale)")
        return 1.0 - minScale
    }
    
    func getRotationAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offSet.width
        let percentage = Double(currentAmount / max)
        let maxAngle: Double = 10
        print("rotation amount: \(percentage * maxAngle)")
        return percentage * maxAngle
    }
}

struct DragGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureBootcamp()
    }
}

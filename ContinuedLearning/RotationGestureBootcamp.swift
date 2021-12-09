//
//  RotationGestureBootcamp.swift
//  ContinuedLearning
//
//  Created by Andres camilo Raigoza misas on 8/12/21.
//

import SwiftUI

struct RotationGestureBootcamp: View {
    
    @State var angle = Angle(degrees: 0)
    
    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(50)
            .background(Color.blue.cornerRadius(10))
            .rotationEffect(angle)
            .gesture(
                RotationGesture()
                    .onChanged { value in
                        print(value)
                        let degrees = value * 180 / 3.1416
                        print(degrees)
                        angle = value
                    }
                    .onEnded { value in
                        withAnimation(.spring()) {
                            angle = Angle(degrees: 0)
                        }
                    }
            )
    }
}

struct RotationGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        RotationGestureBootcamp()
    }
}

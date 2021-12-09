//
//  MagnificationGestureBootcamp.swift
//  ContinuedLearning
//
//  Created by Andres camilo Raigoza misas on 8/12/21.
//

import SwiftUI

struct MagnificationGestureBootcamp: View {
    
    @State var currentAmount: CGFloat = 0
    @State var lastAmount: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Circle().frame(width: 35, height: 35)
                Text("Swiftful Thinking")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            Rectangle()
                .frame(height: 300)
                .scaleEffect(1 + currentAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            if value >= 1.0 {
                                currentAmount = value - 1
                            }
                        }
                        .onEnded{ value in
                            withAnimation(.spring()) {
                                currentAmount = 0
                            }
                        }
                )
            
            HStack {
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
            .padding(.horizontal)
            .font(.headline)
            Text("This is the caption for my photo!")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        }
        
//        VStack {
//            Text("Scale: \(1 + currentAmount + lastAmount)")
//                .font(.title)
//            Spacer()
//            Text("Hello, World!")
//                .font(.title)
//                .padding(40)
//                .background(.red)
//                .cornerRadius(10)
//                .scaleEffect(1 + currentAmount + lastAmount)
//                .gesture(
//                    MagnificationGesture()
//                        .onChanged { value in
//                            print("Changed Value: \(value)")
//                            currentAmount = value - 1
//                            print("current amount: \(currentAmount)")
//                        }
//                        .onEnded { value in
//                            print("Ended Value: \(value)")
//                            lastAmount += currentAmount
//                            currentAmount = 0
//                            print("last amount: \(lastAmount)")
//                        }
//                )
//            Spacer()
//        }
    }
}

struct MagnificationGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGestureBootcamp()
    }
}

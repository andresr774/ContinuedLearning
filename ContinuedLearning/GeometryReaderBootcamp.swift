//
//  GeometryReaderBootcamp.swift
//  ContinuedLearning
//
//  Created by Andres camilo Raigoza misas on 9/12/21.
//

import SwiftUI

struct GeometryReaderBootcamp: View {
    
    @State var geometryMaxX: CGFloat = 0
    @State var max: CGFloat = 1.0
    @State var x: CGFloat = 0
    @State var percentage: Double = 0
    
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        max = maxDistance
        x = currentX
        percentage = Double(1 - (currentX / maxDistance))
        return Double(1 - (currentX / maxDistance))
    }
    
    var body: some View {
        VStack {
            Text("maxDistance: \(max)")
            Text("currentX: \(x)")
            Text("percentage: \(percentage)")
            Text("max X: \(geometryMaxX)")
            Spacer()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<20) { index in
                        GeometryReader { geometry in
                            RoundedRectangle(cornerRadius: 20)
                                .rotation3DEffect(
                                    Angle(degrees: getPercentage(geo: geometry) * 40),
                                    axis: (x: 0, y: 1.0, z: 0))
                                .onAppear {
                                    geometryMaxX = geometry.frame(in: .global).maxX
                                }
                        }
                        .frame(width: 300, height: 250)
                        .padding()
                    }
                }
            }
            Spacer()
        }
        
//        GeometryReader { geometry in
//            HStack(spacing: 0) {
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: geometry.size.width * 2 / 3)
//                Rectangle().fill(.blue)
//            }
//            .ignoresSafeArea()
//        }
    }
}

struct GeometryReaderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderBootcamp()
    }
}

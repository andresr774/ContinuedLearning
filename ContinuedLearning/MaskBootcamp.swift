//
//  MaskBootcamp.swift
//  ContinuedLearning
//
//  Created by Andres camilo Raigoza misas on 10/12/21.
//

import SwiftUI

struct MaskBootcamp: View {
    
    @State var rating = 0
    
    var body: some View {
        ZStack {
            starsView
                .overlay(overlayView.mask(starsView))
        }
    }
    
    private var overlayView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    //.foregroundColor(.yellow)
                    .fill(
                        LinearGradient(colors: [.red, .yellow], startPoint: .leading, endPoint: .trailing)
                    )
                    .frame(width: (CGFloat(rating) / 5) * geometry.size.width)
            }
        }
        // Now this layer doesn't receive taps, it allows the user to tap the background layer instead of this one.
        .allowsHitTesting(false)
    }
    
    private var starsView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = index
                        }
                    }
            }
        }
    }
}

struct MaskBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MaskBootcamp()
    }
}

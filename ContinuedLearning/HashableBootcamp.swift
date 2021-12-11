//
//  HashableBootcamp.swift
//  ContinuedLearning
//
//  Created by Andres camilo Raigoza misas on 10/12/21.
//

import SwiftUI

struct MyCustomModel: Hashable {
    let title: String
    let subtitle: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title + subtitle)
    }
}

struct HashableBootcamp: View {
    
    let data: [MyCustomModel] = [
        MyCustomModel(title: "ONE", subtitle: "1"),
        MyCustomModel(title: "TWO", subtitle: "2"),
        MyCustomModel(title: "THREE", subtitle: "3"),
        MyCustomModel(title: "FOUR", subtitle: "4"),
        MyCustomModel(title: "FIVE", subtitle: "5"),
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                ForEach(data, id: \.self) {
                    Text($0.hashValue.description)
                        .font(.headline)
                }
            }
        }
    }
}

struct HashableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HashableBootcamp()
    }
}

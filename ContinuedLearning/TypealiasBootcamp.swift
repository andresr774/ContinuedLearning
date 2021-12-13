//
//  TypealiasBootcamp.swift
//  ContinuedLearning
//
//  Created by Andres camilo Raigoza misas on 13/12/21.
//

import SwiftUI

struct MovieModel {
    let title: String
    let director: String
    let count: Int
}

typealias TVModel = MovieModel

struct TypealiasBootcamp: View {
    
    //@State var item: MovieModel = MovieModel(title: "Title", director: "joe", count: 5)
    @State var item: TVModel = TVModel(title: "TV tilte", director: "Emmily", count: 7)
    
    var body: some View {
        VStack {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}

struct TypealiasBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TypealiasBootcamp()
    }
}

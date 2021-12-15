//
//  DownloadWithCombine.swift
//  ContinuedLearning
//
//  Created by Andres camilo Raigoza misas on 14/12/21.
//

import SwiftUI
import Combine

struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class DownloadWithCombineViewModel: ObservableObject {
    
    @Published var posts: [PostModel] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        // Combine discussion
        /*
        // 1. Sign up for monthly subscription for package to be delivered
        // 2. The company would make the package behind the scene
        // 3. Recieve the package at your front door
        // 4. Make sure the box isn't damaged
        // 5. Open and make sure the item is correct
        // 6. Use the item!!!
        // 7. Cancellable at any time!!
        
        // 1. Create the publisher
        // 2. Subscribe the publisher on background thread
        // 3. Recieve on main thread
        // 4. tryMap (Check that the data is good)
        // 5. decode (Decode data into PostModels)
        // 6. sink (put the item into our app)
        // 7. store (cancel subscription if nedded)
        */
        
        URLSession.shared.dataTaskPublisher(for: url)
            //.subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            // Replace error in case we don't wanna handle the errors, and istead give it a replace value
//            .replaceError(with: [])
//            .sink(receiveValue: { [weak self] returnedPosts in
//                self?.posts = returnedPosts
//            })
            
            // sink with recieve value completion in case we want to handle errors:
            .sink { completion in
                
                switch completion {
                case .finished:
                    print("Finished")
                case .failure(let error):
                    print("there was an error. \(error)")
                }
            } receiveValue: { [weak self] returnedPosts in
//                Thread.isMainThread
//                Thread.current
                self?.posts = returnedPosts
            }
            .store(in: &cancellables)
    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
                throw URLError(.badServerResponse)
            }
        return output.data
    }
}

struct DownloadWithCombine: View {
    
    @StateObject var vm = DownloadWithCombineViewModel()
    
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct DownloadWithCombine_Previews: PreviewProvider {
    static var previews: some View {
        DownloadWithCombine()
    }
}

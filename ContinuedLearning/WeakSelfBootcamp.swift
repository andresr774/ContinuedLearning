//
//  WeakSelfBootcamp.swift
//  ContinuedLearning
//
//  Created by Andres camilo Raigoza misas on 12/12/21.
//

import SwiftUI

struct WeakSelfBootcamp: View {
    
    @AppStorage("count") var count: Int?
    
    init() {
        count = 0
    }
    
    var body: some View {
        NavigationView {
            NavigationLink("Navigate") {
                WeakSelfSecondScreen()
            }
            .navigationTitle("Screen 1")
        }
        .overlay(alignment: .topTrailing) {
            Text("\(count ?? 0)")
                .font(.largeTitle)
                .padding()
                .background(Color.green.cornerRadius(10))
        }
    }
}

struct WeakSelfSecondScreen: View {
    
    @StateObject var vm = WeakSelfSecondScreenViewModel()
    
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
            .foregroundColor(.red)
            
            if let data = vm.data {
                Text(data)
            }
        }
    }
}

class WeakSelfSecondScreenViewModel: ObservableObject {
    
    @Published var data: String?
    
    init() {
        print("INITIALIZE NOW")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount + 1, forKey: "count")
        getData()
    }
    
    deinit {
        print("DEINITILIZE NOW")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount - 1, forKey: "count")
    }
    
    func getData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 500) { [weak self] in
            self?.data = "NEW DATA!!!"
        }
    }
}

struct WeakSelfBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        WeakSelfBootcamp()
    }
}

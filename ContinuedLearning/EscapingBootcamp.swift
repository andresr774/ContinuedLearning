//
//  EscapingBootcamp.swift
//  ContinuedLearning
//
//  Created by Andres camilo Raigoza misas on 13/12/21.
//

import SwiftUI
import CoreMedia

class EscapingViewModel: ObservableObject {
    
    @Published var text = "Hello"
    
    func getData() {
        downloadData5 { [weak self] returnedResult in
            self?.text = returnedResult.data
        }
//        downloadData4 { [weak self] returnedResult in
//            self?.text = returnedResult.data
//        }
//        downloadData3 { [weak self] data in
//            self?.text = data
//        }
    }
    
    func downloadData() -> String {
        return "New data!"
    }
    
    func downloadData2(completionHandler: (_ data: String) -> ()) {
        completionHandler("New data!")
    }
    
    func downloadData3(completionHandler: @escaping (_ data: String) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            completionHandler("New data!")
        }
    }
    
    func downloadData4(completionHandler: @escaping (DownloadResult) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "New data!")
            completionHandler(result)
        }
    }
    
    func downloadData5(completionHandler: @escaping DownloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "New data!")
            completionHandler(result)
        }
    }
}

struct DownloadResult {
    let data: String
}

typealias DownloadCompletion = (DownloadResult) -> ()

struct EscapingBootcamp: View {
    
    @StateObject var vm = EscapingViewModel()
    
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.blue)
            .onTapGesture {
                vm.getData()
            }
    }
}

struct EscapingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        EscapingBootcamp()
    }
}

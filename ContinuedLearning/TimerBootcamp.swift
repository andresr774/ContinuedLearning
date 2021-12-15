//
//  TimerBootcamp.swift
//  ContinuedLearning
//
//  Created by Andres camilo Raigoza misas on 14/12/21.
//

import SwiftUI

struct TimerBootcamp: View {
    
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    @State var currentDate = Date()
    
    // Current time:
    /*
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        //formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }
    */
    
    // Countdown
    /*
    @State var count = 10
    @State var finishedText: String?
     */
    
    // Countdown to date
    /*
    @State var timeRemaining = ""
    let futureDate: Date = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
    
    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.minute, .second], from: Date(), to: futureDate)
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        
        timeRemaining = "\(minute) minutes, \(second) seconds"
    }
     */
    
    // Animation counter
    @State var count = 1
    
    var body: some View {
        ZStack {
            RadialGradient(
                colors: [Color("Grape"), Color("Eggplant")],
                center: .center,
                startRadius: 5,
                endRadius: 500)
                .ignoresSafeArea()
            
            TabView(selection: $count) {
                Rectangle()
                    .foregroundColor(.red)
                    .tag(1)
                Rectangle()
                    .foregroundColor(.blue)
                    .tag(2)
                Rectangle()
                    .foregroundColor(.green)
                    .tag(3)
                Rectangle()
                    .foregroundColor(.orange)
                    .tag(4)
                Rectangle()
                    .foregroundColor(.pink)
                    .tag(5)
            }
            .frame(height: 300)
            .tabViewStyle(PageTabViewStyle())
            
//            HStack(spacing: 15) {
//                Circle()
//                    .offset(y: count == 1 ? -20 : 0)
//                Circle()
//                    .offset(y: count == 2 ? -20 : 0)
//                Circle()
//                    .offset(y: count == 3 ? -20 : 0)
//            }
//            .frame(width: 150)
//            .foregroundColor(.white)
            
//            Text(timeRemaining)
//                .font(.system(size: 100, weight: .semibold, design: .rounded))
//                .foregroundColor(.white)
//                .lineLimit(1)
//                .minimumScaleFactor(0.1)
        }
        .onReceive(timer) { _ in
            withAnimation(.default) {
                count = count == 5 ? 1 : count + 1
            }
        }
    }
}

struct TimerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TimerBootcamp()
    }
}

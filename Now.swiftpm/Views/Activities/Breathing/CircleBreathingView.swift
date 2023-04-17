//
//  CircleBreathingView.swift
//  
//
//  Created by Ale on 14/04/23.
//

import SwiftUI

struct CircleBreathingView: View {
    @State private var scale: CGFloat = 0.5
    @State private var isInspiring = true
    @State private var started = false
    @Binding var timer : Timer?
    @Binding var elapsedSeconds : Int
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        if started {
            ZStack {
                Circle()
                    .scaleEffect(scale)
                    .animation(
                        Animation.easeInOut(duration: 5)
                            .repeatForever(autoreverses: true)
                    )
                    .onAppear {
                        scale = 1
                    }
                    .animation(
                        Animation.easeInOut(duration: 7)
                            .delay(5)
                    )
                    .onDisappear {
                        scale = 0.5
                    }
                if isInspiring {
                    withAnimation(.easeInOut) {
                        Text("Breathe in")
                            .font(FontViewModel.shared.fontGentiumPlusTitle5)
                            .foregroundColor(isDarkMode ? .black : .white)
                    }
                } else {
                    withAnimation(.easeInOut) {
                        
                        Text("Breathe out")
                            .font(FontViewModel.shared.fontGentiumPlusTitle5)
                            .foregroundColor(isDarkMode ? .black : .white)
                    }
                }
            }
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
                    self.isInspiring.toggle()
                }
            }
        } else {
            ZStack {
                Circle()
                    .scale(0.5)
                
                Text("Tap to start")
                    .foregroundColor(isDarkMode ? .black : .white)
                    .font(FontViewModel.shared.fontGentiumPlusTitle5)
            }.onTapGesture {
                started = true
                startTimer()
            }
            
            
        }
    }
    
    private func startTimer() {
        elapsedSeconds = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            elapsedSeconds += 1
        }
    }
    
    
    
}


struct CircleBreathingView_Previews: PreviewProvider {
    static var previews: some View {
        CircleBreathingView(timer: .constant(Timer()), elapsedSeconds: .constant(0))
    }
}

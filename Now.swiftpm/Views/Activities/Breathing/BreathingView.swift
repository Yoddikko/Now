//
//  BreathingView.swift
//  
//
//  Created by Ale on 14/04/23.
//

import SwiftUI

struct BreathingView: View {
    @EnvironmentObject var userData: UserData
    @State private var elapsedSeconds = 0
    @State private var timer: Timer?
    
    @State var infoViewToggle = false
    @Binding var isPresented : Bool
    var body: some View {
        VStack {
            HStack {
                Text("Breathe.")
                    .font(FontViewModel.shared.fontGentiumPlusTitle3)
            }
            Text("Learning these breathing techniques have allowed me to control anxiety during moments of panic.")
                .padding(.horizontal)
                .padding(.bottom, 1)
                .multilineTextAlignment(.center)
            
                .font(FontViewModel.shared.fontGentiumPlusItalicBody)
                .foregroundColor(.secondary)
            Text("Deep abdominal breathing encourages full oxygen exchange — that is, the beneficial trade of incoming oxygen for outgoing carbon dioxide. Not surprisingly, it can slow the heartbeat and lower or stabilize blood pressure.")
                .padding(.horizontal)
            
                .font(FontViewModel.shared.fontGentiumPlusBody)
            
            Divider()
            
            CircleBreathingView( timer: $timer, elapsedSeconds: $elapsedSeconds)
            BreathingTextsView()
            Spacer()
            
            Button {
                stopTimer()
                isPresented = false
                SoundViewModel.shared.playCompletionSoundHarp1()
                
                userData.setBreathing(time: elapsedSeconds)
                
            } label: {
                Text("I'm ready to go")
                    .font(FontViewModel.shared.fontGentiumPlusTitle4)
                    .padding(.horizontal, 30)
            }
            .background(RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.orange.opacity(0.2))
            )
            .padding()
            
        }
        .onDisappear {
            stopTimer()
            
            userData.setBreathing(time: elapsedSeconds)
            
        }
    }
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
}


struct BreathingView_Previews: PreviewProvider {
    static var previews: some View {
        BreathingView( isPresented: .constant(true))
    }
}

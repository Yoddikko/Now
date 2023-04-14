//
//  SwiftUIView.swift
//  
//
//  Created by Ale on 14/04/23.
//

import SwiftUI

struct BreathingTextsView: View {
    
    let breathingStrings = [
        "Focus on the present moment",
        "Let go of any tension in your body",
        "Feel the calmness spread through you",
        "Breathe deeply and let go of stress",
        "Inhale peace, exhale tension",
        "Allow your breath to guide you to calmness",
        "Find stillness within yourself",
        "Let your mind relax and your body follow",
        "Each breath brings you closer to relaxation",
        "Release any worries with each exhale",
        "Let go of your worries",
        "Breathe in peace, breathe out stress",
        "Focus on your breath",
        "Feel your chest rise and fall",
        "Inhale calm, exhale tension",
        "Let each breath fill you with calm",
        "Take a deep breath and let it go",
        "Clear your mind, just breathe"]
    
    @State private var currentStringIndex = 0
    
    var body: some View {
        Text(breathingStrings[currentStringIndex])
            .font(FontViewModel.shared.fontGentiumPlusBoldBody)
            .multilineTextAlignment(.center)
            .padding()
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 12, repeats: true) { timer in
                    withAnimation(.easeInOut(duration: 0.5)) {
                        self.currentStringIndex = (self.currentStringIndex + 1) % self.breathingStrings.count
                    }
                }
            }
    }
}

struct BreathingTextsView_Previews: PreviewProvider {
    static var previews: some View {
        BreathingTextsView()
    }
}

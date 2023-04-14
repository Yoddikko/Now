//
//  BreathingView.swift
//  
//
//  Created by Ale on 14/04/23.
//

import SwiftUI

struct BreathingView: View {
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
                
                CircleBreathingView()
                BreathingTextsView()
                Spacer()
                
                Button {
                    isPresented = false
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
    }
}


struct BreathingView_Previews: PreviewProvider {
    static var previews: some View {
        BreathingView( isPresented: .constant(true))
    }
}

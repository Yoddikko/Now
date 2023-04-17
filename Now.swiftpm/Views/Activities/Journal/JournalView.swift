//
//  SwiftUIView.swift
//  
//
//  Created by Ale on 15/04/23.
//

import SwiftUI

struct JournalView: View {
    
    @EnvironmentObject var userData: UserData
    
    let textfieldID = UUID()
    
    @State private var keyboardHeight: CGFloat = 0
    
    @State var text = ""
    
    @Binding var isPresented : Bool
    
    @State var textOpacity = 1.0
    
    var placeholder =  "placeholder"
    
    var isBold = false
    
    var body: some View {
        
        ScrollViewReader { value in
            
            Text("Compose.")
                .font(FontViewModel.shared.fontGentiumPlusTitle3)
            
            
            Text("Write something down. Anything. Writing down my thoughts helped me gain clarity in my mind, I started by describing my days and feelings.")
                .padding(.horizontal)
                .padding(.bottom, 1)
                .multilineTextAlignment(.center)
                .opacity(textOpacity)
                .font(FontViewModel.shared.fontGentiumPlusItalicBody)
                .foregroundColor(.secondary)
            
            
            Text("Taking a few minutes each day to write down thoughts, feelings, and experiences can help reduce stress, increase self-awareness, and improve overall well-being. Journaling can also provide a space for reflection and problem-solving, as well as a way to track progress towards personal goals. Journaling can enhance creativity and serve as a way to preserve memories.")
                .padding(.horizontal)
                .font(FontViewModel.shared.fontGentiumPlusBody)
                .opacity(textOpacity)
            
            Divider()
            
            Text(getFormattedDate())
                .font(FontViewModel.shared.fontGentiumPlusTitle4)
                .padding(.top, 30)
                .padding(.bottom, -10)
            
            
            LargeTextField(text: $text)
            
            Spacer()
            
            HStack {
                Button {
                    isPresented = false
                    
                    SoundViewModel.shared.playCompletionSoundHarp1()
                    
                    userData.setJournalText(text: text)
                } label: {
                    
                    Text("I'm ready to go")
                        .font(FontViewModel.shared.fontGentiumPlusTitle4)
                        .padding(.horizontal, 40)
                }                .background(RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.orange.opacity(0.2))
                )
            }.id(textfieldID)
            
            
            
                .padding()
                .onAppear {
                    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (notification) in
                        value.scrollTo(textfieldID, anchor: .bottom)
                        withAnimation {
                            textOpacity = 0
                        }
                    }
                    
                    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (notification) in
                        self.keyboardHeight = 0
                        withAnimation {
                            textOpacity = 1
                        }
                    }
                    
                }
        }
        .scrollDisabled(false)
        .onDisappear {
            userData.setJournalText(text: text)
        }
        
        .onAppear {
            text = userData.getJournalText()
        }
    }
    
    
    func getFormattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM"
        return dateFormatter.string(from: Date())
    }
    
    
}

struct JournalView_previews: PreviewProvider {
    static var previews: some View {
        JournalView( isPresented: .constant(true))
    }
}

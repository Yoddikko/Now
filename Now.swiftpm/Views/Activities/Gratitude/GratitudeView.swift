//
//  SwiftUIView.swift
//  
//
//  Created by Ale on 16/04/23.
//

import SwiftUI

struct GratitudeView: View {
    
    @EnvironmentObject var userData: UserData
    
    @Binding var isPresented : Bool
    
    @State var textOpacity = 1.0
    var textfieldID = UUID()
    @State private var keyboardHeight: CGFloat = 0
    
    @State var text1 = ""
    @State var text2 = ""
    @State var text3 = ""
    
    
    var body: some View {
        ScrollViewReader { value in
            VStack {
                Text("Be grateful.")
                    .font(FontViewModel.shared.fontGentiumPlusTitle3)
                    .opacity(textOpacity)
                
                Text("Take a look at what you have, don't chase what you don't have.")
                    .padding(.horizontal)
                    .padding(.bottom, 1)
                    .multilineTextAlignment(.center)
                    .opacity(textOpacity)
                    .font(FontViewModel.shared.fontGentiumPlusItalicBody)
                    .foregroundColor(.secondary)
                
                
                Text("When we take the time to focus on what we have rather than what we lack, we cultivate a sense of abundance and appreciation for the present moment. Gratitude can also help us shift our perspective from one of self-centeredness to one of generosity and compassion, as we become more attuned to the needs and experiences of others")
                    .font(FontViewModel.shared.fontGentiumPlusBody)
                    .opacity(textOpacity)
                    .padding(.horizontal, 45)
                Divider()
            }
            .background{
                Rectangle().foregroundColor(.gray)
                    .opacity(0.000000000000000001)
                    .onTapGesture {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
            }

            VStack (spacing: 30) {
                HStack (spacing: 40) {
                    Spacer()
                    CustomTextField(text: $text1)
                    
                    CustomTextField(text: $text2)
                    Spacer()
                }
                HStack {
                    Spacer()
                    CustomTextField(text: $text3)
                    Spacer()
                }
                
                
            }
            .padding()
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }

            
            
            Spacer()
            
            HStack {
                Button {
                    
                    SoundViewModel.shared.playCompletionSoundHarp1()
                    isPresented = false
                    
                    userData.setGratitudeStrings(strings: [text1, text2, text3])
                    print(userData.getGratitudeStrings())
                } label: {
                    
                    Text("I'm ready to go")
                        .font(FontViewModel.shared.fontGentiumPlusTitle4)
                        .padding(.horizontal, 40)
                }
                .background(RoundedRectangle(cornerRadius: 15)
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
                .onDisappear {
                    userData.setGratitudeStrings(strings: [text1, text2, text3])

                }
        }
        .onAppear {
            let userDataStringsCount : Int = userData.getGratitudeStrings().count
            
            if userDataStringsCount == 0 {
                text1 = ""
                text2 = ""
                text3 = ""
            }
            else if userDataStringsCount == 1 {
                text1 = userData.getGratitudeStrings()[0]
            }
            
            else if userDataStringsCount == 2 {
                text1 = userData.getGratitudeStrings()[0]
                text2 = userData.getGratitudeStrings()[1]
            }
            
            else if userDataStringsCount == 3 {
                text1 = userData.getGratitudeStrings()[0]
                text2 = userData.getGratitudeStrings()[1]
                text3 = userData.getGratitudeStrings()[2]
            }
            
            
            
        }
        
    }
}

@ViewBuilder
func createTextField (text: Binding<String>, characterLimit: Binding<Int>, characterLeft: Binding<Int>) -> some View {
    TextField("I'm grateful for...", text: text)
        .font(FontViewModel.shared.fontGentiumPlusBody)
        .padding(10)
        .border(Color.secondary, width: 1)
        .cornerRadius(10)
        .frame(maxWidth: 300)
        .background(
            RoundedRectangle(cornerRadius: 8)
            
            
                .stroke(Color.gray, lineWidth: 1))
    
}

struct Gratitude_Previews: PreviewProvider {
    static var previews: some View {
        GratitudeView(isPresented: .constant(true))
    }
}

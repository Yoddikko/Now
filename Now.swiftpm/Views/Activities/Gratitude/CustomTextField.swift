//
//  SwiftUIView.swift
//  
//
//  Created by Ale on 18/04/23.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    var characterLimit = 25
    @State var characterLeft = 25
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.secondary, lineWidth: 1)
                
                TextField("I'm grateful for...",text: $text)
                    .font(FontViewModel.shared.fontGentiumPlusBody)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .onChange(of: text) { newValue in
                        characterLeft = characterLimit - newValue.count
                        if newValue.count > characterLimit {
                            text = String(newValue.prefix(characterLimit))
                        }
                    }
            }
            .frame(width: 300, height: 75)
        }
    }
}

struct CustomTextField_previews: PreviewProvider {
    static var previews: some View {
        TextEditor(text: .constant(""))
    }
}

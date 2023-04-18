import SwiftUI

struct LargeTextField: View {
    @Binding var text: String
    var characterLimit = 300
    @State var characterLeft = 300
    var body: some View {
        VStack {
            TextEditor(text: $text)
                .font(FontViewModel.shared.fontGentiumPlusBody)
                .frame(height: 150)
                .cornerRadius(10)
                .border(Color.secondary, width: 1)
                .padding(.horizontal)
            
                .onChange(of: text) { newValue in
                    characterLeft = characterLimit - newValue.count
                    
                    if newValue.count > characterLimit {
                        text = String(newValue.prefix(characterLimit))
                    }
                }
        }
        HStack {
            Spacer()
            Text(characterLeft.description)
                .font(FontViewModel.shared.fontGentiumPlusBoldBody)
                .foregroundColor(.secondary)
                .padding(.horizontal)
        }
        
    }
}

struct LargeTextField_previews: PreviewProvider {
    static var previews: some View {
        TextEditor(text: .constant(""))
    }
}

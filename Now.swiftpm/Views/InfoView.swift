//
//  InfoView.swift
//  Now
//
//  Created by Ale on 13/04/23.
//

import SwiftUI

struct InfoView: View {
    var fontViewModel = FontViewModel()
    
    var body: some View {
        ScrollView {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.clear)
                    .overlay{
                        LinearGradient(
                            gradient: Gradient(colors: [Color.orange.opacity(0.95), Color.orange.opacity(0.85)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ).cornerRadius(15)
                            .edgesIgnoringSafeArea(.all)
                        
                    }
                    .opacity(0.95)
                VStack (spacing: 15) {
                    Text("Why Now.?")
                        .font(fontViewModel.fontGentiumPlusBoldBody)
                    
                    ForEach(Strings.allIntroductions, id: \.self) { introcution in
                        Text(introcution)
                            .font(fontViewModel.fontGentiumPlusBody)
                    }
                    
                    Text("Who is the developer?")
                        .font(fontViewModel.fontGentiumPlusBoldBody)
                    ForEach(Strings.allBios, id: \.self) { bio in
                        Text(bio)
                            .font(fontViewModel.fontGentiumPlusBody)
                    }
                    
                    Text("How I created Now.?")
                        .font(fontViewModel.fontGentiumPlusBoldBody)
                    
                    Text(Strings.creation1)
                        .font(fontViewModel.fontGentiumPlusBody)
                    
                    
                    Spacer()
                }
                .padding()
            }
        }.padding([.top, .horizontal], 50)
    }
}

struct Strings {
    static let allIntroductions = [introduction1, introduction2, introduction3]
    static let allBios = [bio1, bio2, bio3]
    static let introduction1 = "With continual distractions and an unending barrage of information, our lives have grown more chaotic and demanding. It's essential to sit back, make time for reflection, and consider what matters most. Stoicism can help in this situation by reminding us to concentrate on the things we can control and to locate a secure place to hide out and think. "
    static let introduction2 = "Even in the midst of chaos, we can maintain our mental and emotional health by practicing inner serenity and tranquility. Take a deep breath, find a quiet location, and keep in mind that you have the capacity to choose how you respond to the world around you if you're feeling overburdened by the busyness of modern life."
    static let introduction3 = "Now. is a brief experience that offers you the chance to experiment with different introspective techniques and functions as a cozy, peaceful haven. Even in the middle of the chaos of daily life, it offers a secure space to contemplate and refuel thanks to its stoic inspiration."
    static let bio1 = "I'm Alessio, and I'm 23 years old. Hello. I study computer engineering at the University of Naples and at the Apple Academy. Because I think that thoughtful techniques like meditation and stoicism are beneficial for our daily lives and ought to be more widely available and so I developed this experience"
    static let bio2 = "I started to investigate these techniques when I began to feel anxious and uneasy as a result of my university studies and other life situations. I became more aware of the value of mental clarity and began an internal search for tranquility."
    static let bio3 = "During a trip to Africa, I discovered that people there live very differently, enjoying life without too many worries or concerns. This discovery inspired me to create an experience that assists people in finding inner peace and serenity amid the hustle and bustle of modern life. 'Hakuna Matata,' which means 'don't worry' or 'don't have problems,' is a phrase I frequently heard locals repeat."
    static let creation1 = "I wanted to create an experience that was relaxing and pleasing to the eye. I set out to create simple but pleasing illustrations, following an artistic direction. All illlustrations were created by me. The font I used is called 'Gentium Plus'. This experience is built entirely using the SwiftUI framework to build the interface. For the sounds and background music, I used the AVFoundation framework. The whole project was built using the latest design patterns (MVVM) and good code pratices."
    
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

//
//  SwiftUIView.swift
//  
//
//  Created by Ale on 16/04/23.
//

import SwiftUI

struct StoicismView: View {
    
    @Binding var isPresented : Bool
    
    var body: some View {
        ScrollView {
            Text("Stoicism")
                .font(FontViewModel.shared.fontGentiumPlusTitle3)
            
            Text(Texts.text1)
                .padding(.horizontal)
                .font(FontViewModel.shared.fontGentiumPlusBody)
            
            Image("zeno_of_citium")
                .resizable()
                .padding()
                .frame(width: 300, height: 400)
            
            Text(Texts.text2)
                .padding(.horizontal)
                .padding(.bottom)
                .font(FontViewModel.shared.fontGentiumPlusBody)
                
        }
    }
    
    
    
    
}

struct Texts {
    static let text1 = "The philosophy of Stoicism has its roots in ancient Greece, dating back to the 3rd century BCE. Zeno of Citium founded it, imparting his teachings to his students that living a virtuous life characterized by wisdom, self-control, justice, courage, and mindfulness was the means to attain happiness and fulfillment. "
    
    static let text2 = "In today's world, Stoicism has found new popularity, especially among people  seeking a more meaningful and purposeful life. Its emphasis on self-control, mindfulness, and resilience can be especially helpful in today's fast-paced, interconnected world, where many people feel overwhelmed and disconnected from their values ​​and goals. By teaching us to focus on the present moment and accept things as they are, Stoicism can help us become more aware of our thoughts and feelings and be more attuned to the world around us. This heightened awareness can lead to  clarity of thought, better decision-making, and a more fulfilling life. Overall, Stoicism provides a powerful framework for living a meaningful and fulfilling life and  cultivating the kind of inner strength and resilience that helps us navigate the challenges of today's world."
}

struct StoicismView_Previews: PreviewProvider {
    static var previews: some View {
        StoicismView(isPresented: .constant(true))
    }
}

//
//  SwiftUIView.swift
//  
//
//  Created by Ale on 17/04/23.
//

import SwiftUI

struct RecapView: View {
     
    @StateObject private var userData = UserData()

    var body: some View {
        VStack (spacing: 25) {
            Spacer()
            Text("You are ready for the present. You can go now.")
                .font(FontViewModel.shared.fontGentiumPlusTitle3)
                .multilineTextAlignment(.center)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque est quam, egestas nec eleifend nec, consequat sed mi. Proin dignissim volutpat orci, eu placerat dui vestibulum sed. Nulla sit amet luctus leo, scelerisque eleifend massa. Donec lectus nisl, suscipit vel ullamcorper eu, rhoncus vel orci. Phasellus et sapien vulputate, pretium nisl at, maximus tellus. In in gravida ligula, eu viverra quam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sed feugiat est, id egestas augue. Nulla eget tellus egestas dui dictum dignissim. Maecenas gravida nunc at faucibus mattis. Curabitur pharetra sapien tortor, et varius neque dictum nec. In quis arcu in nisl viverra hendrerit. Proin facilisis pharetra sapien vitae cursus. Mauris libero nisl, pellentesque a quam nec, efficitur commodo risus. Etiam fringilla a orci ac efficitur. Nullam a tincidunt erat. Sed hendrerit malesuada tristique. Quisque posuere ante ultricies leo blandit consequat. Cras justo mi, tristique quis lectus nec, imperdiet hendrerit nulla. Pellentesque urna neque, convallis sit amet gravida in, mattis sed orci. Suspendisse tincidunt quam vitae magna vestibulum, sed vehicula nisi venenatis. ")
                .font(FontViewModel.shared.fontGentiumPlusBody)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 15)  .foregroundColor(.secondary.opacity(0.2))
                }
            
            VStack {
                Text("Quote QuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuoteQuote ")
                    .multilineTextAlignment(.center)
                    .font(FontViewModel.shared.fontGentiumPlusItalicBody)
                
                Text("Author Author")
                    .font(FontViewModel.shared.fontGentiumPlusBoldBody)
            }.padding()
                .background {
                    RoundedRectangle(cornerRadius: 15)  .foregroundColor(.secondary.opacity(0.2))
                }
            
            
            
                .font(FontViewModel.shared.fontGentiumPlusBoldBody)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 15)  .foregroundColor(.secondary.opacity(0.2))
                }

            

            
            Spacer()
        }.padding()
    }
}

struct RecapView_Previews: PreviewProvider {
    static var previews: some View {
        RecapView()
    }
}

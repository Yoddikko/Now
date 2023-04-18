//
//  SwiftUIView.swift
//  
//
//  Created by Ale on 17/04/23.
//

import SwiftUI

struct LeaveView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var userData: UserData
    @State var showRecap = false
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Spacer()
            Text("Are you ready to leave?")
                .font(FontViewModel.shared.fontGentiumPlusTitle3)
            
            
            Spacer()
            VStack (spacing: 10) {
                Button {
                    isPresented = false
                } label: {
                    ZStack {
                        Text("I'm not ready to leave")
                            .font(FontViewModel.shared.fontGentiumPlusTitle4)
                            .foregroundColor(.orange)
                            .padding(.horizontal)
                    }
                    .background(RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.secondary.opacity(0.1))
                    )
                    

                }
                Button {
                    Persistence.shared.saveUserData(context: viewContext, userData: userData)
                    showRecap = true
                } label: {
                    ZStack {
                        
                        Text("I'm not ready to leave")
                            .font(FontViewModel.shared.fontGentiumPlusTitle4)
                            .padding(.horizontal)
                            .foregroundColor(.clear)
                        
                        Text("I'm ready to leave")
                            .font(FontViewModel.shared.fontGentiumPlusTitle4)
                            .foregroundColor(.red)
                            .padding(.horizontal)
                    }
                }
                .background(RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.red.opacity(0.2))
                )
                .padding(.bottom)
            }
            .fullScreenCover(isPresented: $showRecap, content: {
                RecapView()
            })
        }.presentationDetents([.medium])
        
          

    }
    
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        LeaveView(isPresented: .constant(true))
    }
}

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

    @Binding var isPresented : Bool
    
    var body: some View {
        VStack {
            Text("Are you ready to leave?")
                .font(FontViewModel.shared.fontGentiumPlusTitle3)
            
            
            Spacer()
            VStack (spacing: 10) {
                Button {
                    Persistence.shared.saveUserData(context: viewContext, userData: userData)
                } label: {
                    ZStack {
                        Text("Save today's data")
                            .font(FontViewModel.shared.fontGentiumPlusTitle4)
                            .padding(.horizontal, 30)
                    }
                }
                .background(RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.secondary.opacity(0.1))
                )
                
                
                Button {
                    isPresented = false
                } label: {
                    ZStack {
                        Text("Save today's data")
                            .font(FontViewModel.shared.fontGentiumPlusTitle4)
                            .padding(.horizontal, 30)
                            .foregroundColor(.clear)
                        
                        Text("I'm ready to leave")
                            .font(FontViewModel.shared.fontGentiumPlusTitle4)
                            .foregroundColor(.red)
                    }
                }
                .background(RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.red.opacity(0.2))
                )
                .padding(.bottom)
            }
        }
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        LeaveView(isPresented: .constant(true))
    }
}

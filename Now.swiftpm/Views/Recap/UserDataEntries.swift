//
//  UserDataEntries.swift
//  
//
//  Created by Ale on 18/04/23.
//

import SwiftUI

struct UserDataEntries: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var userDataEntities = [UserDataEntity]()
    @State var showRecap = false
    @State var showRecap2 = false
    @Binding var isPresented : Bool
    
    @State var userData : UserData? = nil
    @State var userDataEntity : UserDataEntity? = nil
    var body: some View {
        if userDataEntities.isEmpty {
            VStack {
                Spacer()
                Text("No entries")
                    .font(FontViewModel.shared.fontGentiumPlusBody)
                    .foregroundColor(.secondary)
                Spacer()
            }.onAppear {
                userDataEntities =  Persistence.shared.fetchUserDataEntities(context: viewContext) ?? []
            }
        } else {
            List {
                ForEach (userDataEntities) { userData in
                    Button(action: {
                        self.userDataEntity = userData
                        showRecap = true
                    }, label: {
                        Text(formatDateString(userData.date) ?? userData.date)
                    })
                }
            }
            .onChange(of: showRecap, perform: { newValue in
                if newValue {
                    showRecap2 = showRecap
                }
                showRecap = false
            })
            
            .fullScreenCover(isPresented: $showRecap2, content: {
                HistoryRecapView(userData: Persistence.shared.getUserData(uuid: userDataEntity!.id, context: viewContext)!, isPresented: $showRecap2)
            })
        }
    }
}


func formatDateString(_ dateString: String) -> String? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
    guard let date = dateFormatter.date(from: dateString) else { return nil }
    
    dateFormatter.dateFormat = "d MMMM 'at' HH:mm"
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    return dateFormatter.string(from: date)
}

struct UserDataEntries_Previews: PreviewProvider {
    static var previews: some View {
        UserDataEntries(isPresented: .constant(true))
    }
}

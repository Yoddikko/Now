//
//  SwiftUIView.swift
//  
//
//  Created by Ale on 18/04/23.
//

import SwiftUI

struct HistoryRecapView: View {
    
    var userData: UserData
    @Binding var isPresented: Bool
    var body: some View {
        NavigationView {
            ScrollView {
                Spacer()
                Text("I am ready for the present, now.")
                    .font(FontViewModel.shared.fontGentiumPlusTitle3).padding()
                    .onAppear {
                        print(userData.getJournalText())
                    }
                if userData.getJournalText() != "" {
                    VStack {
                        
                        Text(getFormattedDate())
                            .font(FontViewModel.shared.fontGentiumPlusTitle4)
                        
                        HStack {
                            Spacer()
                            Text(userData.journal)
                                .fixedSize(horizontal: false, vertical: true)
                                .font(FontViewModel.shared.fontGentiumPlusBody)
                                .lineLimit(10)
                            Spacer()
                        }
                    }.padding()
                        .background {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.secondary.opacity(0.2))
                        }
                }
                
                if userData.gratitude?.count ?? 0 > 0 {
                    VStack {
                        Text("Today I was grateful for...")
                            .font(FontViewModel.shared.fontGentiumPlusTitle4).padding([.top, .bottom])
                        
                        HStack(alignment: .center, spacing: 125) {
                            Spacer()
                            ForEach (userData.gratitude ?? [""], id: \.self) { string in
                                Text(string)
                                    .font(FontViewModel.shared.fontGentiumPlusBody)
                            }
                            Spacer()
                            
                        }.padding(.bottom)
                    }.background {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.secondary.opacity(0.2))
                    }
                }
                
                if userData.quote != nil {
                    VStack {
                        Text("Today's quote")
                            .font(FontViewModel.shared.fontGentiumPlusTitle4)
                        
                        Text(userData.quote?.text ?? "")
                            .multilineTextAlignment(.center)
                            .font(FontViewModel.shared.fontGentiumPlusItalicBody)
                        HStack {
                            Spacer()
                            Text(userData.quote?.author ?? "")
                                .font(FontViewModel.shared.fontGentiumPlusBoldBody)
                            Spacer()
                        }
                        
                    }.padding()
                        .background {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.secondary.opacity(0.2))
                        }
                }
                
                if userData.getBreathingTime() != 0 {
                    VStack {
                        HStack {
                            Spacer()
                            Text("I breathed for")
                                .font(FontViewModel.shared.fontGentiumPlusTitle4)
                            Text(timeString(fromSeconds:userData.getBreathingTime()))
                                .font(FontViewModel.shared.fontGentiumPlusTitle4)
                            Spacer()
                            
                        }
                        
                        
                    }.padding()
                        .background {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.secondary.opacity(0.2))
                            
                        }
                }
                Spacer()
                
            }.toolbar(content: {
                Button {
                    isPresented = false
                } label: {
                    Text("Leave")
                }
            })
            
            
            .padding(.horizontal, 50)
        }.navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .navigationViewStyle(.stack)
    }
}

struct HistoryRecapView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryRecapView(userData: UserData(), isPresented: .constant(true))
    }
}

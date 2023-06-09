//
//  SwiftUIView.swift
//
//
//  Created by Ale on 17/04/23.
//

import SwiftUI

struct RecapView: View {
    
    @EnvironmentObject var userData: UserData
    
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
                        HStack {
                            Text(getFormattedDate())
                                .font(FontViewModel.shared.fontGentiumPlusTitle4)
                        }
                        HStack {
                            Spacer()
                            Text(userData.journal)
                                .multilineTextAlignment(.leading)
                                .font(FontViewModel.shared.fontGentiumPlusBody)
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
                
            }.padding(.horizontal, 50)
                .toolbar(content: {
                    NavigationLink {
                        MenuView()
                    } label: {
                        Text("Leave")
                    }
                })
        }.navigationBarBackButtonHidden(true)
            .navigationViewStyle(.stack)
    }
    
}

func timeString(fromSeconds seconds: Int) -> String {
    let minutes = seconds / 60
    let hours = minutes / 60
    let remainingMinutes = minutes % 60
    let remainingSeconds = seconds % 60

    if hours > 0 {
        return "\(hours) \(hours == 1 ? "hour" : "hours"), \(remainingMinutes) \(remainingMinutes == 1 ? "minute" : "minutes"), and \(remainingSeconds) \(remainingSeconds == 1 ? "second" : "seconds")"
    } else if remainingMinutes > 0 {
        return "\(remainingMinutes) \(remainingMinutes == 1 ? "minute" : "minutes") and \(remainingSeconds) \(remainingSeconds == 1 ? "second" : "seconds")"
    } else {
        return "\(remainingSeconds) \(remainingSeconds == 1 ? "second" : "seconds")"
    }
}


struct RecapView_Previews: PreviewProvider {
    static var previews: some View {
        RecapView()
    }
}

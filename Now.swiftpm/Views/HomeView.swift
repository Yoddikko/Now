//
//  SwiftUIView.swift
//  
//
//  Created by Ale on 13/04/23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var musicViewModel = SoundViewModel.shared
    
    @AppStorage("isDarkMode") private var isDarkMode = true
    
//    @EnvironmentObject var isDarkMode: Bool

    
    @EnvironmentObject var userData: UserData

    @State var showUserDataHistory = false
    
    //MARK: Sheet toggles
    @State var infoViewToggle = false
    @State private var breathingViewisShowingModal = false
    @State private var quoteViewisShowingModal = false
    @State private var journalViewisShowingModal = false
    @State private var gratitudeViewisShowingModal = false
    @State private var stoicismViewShowingModal = false
    @State private var leaveViewisShowingModal = false
    
    
    var body: some View {
        ZStack {
            createBackgroundWithDesert(isDarkMode: $isDarkMode)
                .navigationBarBackButtonHidden(true)
            
            //MARK: Toolbar buttons
            VStack {
                HStack {
                    Button {
                        withAnimation {
                            musicViewModel.musicToggle.toggle()
                        }
                    } label: {
                        Image(systemName: "music.note")
                            .accessibilityLabel("Music")
                            .padding(10)
                            .opacity(musicViewModel.musicToggle ? 1.0 : 0.3)
                    }
                    .background(.regularMaterial)
                    .cornerRadius(10)
                    
                    Button {
                        withAnimation {
                            isDarkMode.toggle()
                        }
                    } label: {
                        if isDarkMode {
                            Image(systemName: "sun.max.fill")
                                .accessibilityLabel("Light mode")

                                .padding(10)
                        } else {
                            Image(systemName: "moon")
                                .accessibilityLabel("Dark mode")

                                .padding(10)
                        }
                    }
                    .background(.regularMaterial)
                    .cornerRadius(10)
                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            stoicismViewShowingModal = true
                        }
                    } label: {
                        Image(systemName: "scroll.fill")
                            .accessibilityLabel("Stoicism introduction")

                            .padding(10)
                    }
                    .background(.regularMaterial)
                    .cornerRadius(10)
                    
                    
                    Button {
                        withAnimation {
                            infoViewToggle.toggle()
                        }
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .accessibilityLabel("Info")

                            .padding(10)
                    }
                    .background(.regularMaterial)
                    .cornerRadius(10)
                    
                    
                    
                }.padding()
                
                Spacer()
            }
            
            
            //MARK: STONES - BREATHING ACTIVITY
            Button {
                breathingViewisShowingModal = true
            } label: {
                Image("stones")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
//            .position(x: UIScreen.main.bounds.width - 1000, y: UIScreen.main.bounds.height - 500)
            .position(getPosition(percentX: 25, percentY: 48))
            .accessibilityLabel("Breathing activity")
            
            //MARK: COLUMN - QUOTES ACTIVITY
            Button {
                quoteViewisShowingModal = true
            } label: {
                Image("column")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            .position(getPosition(percentX: 18, percentY: 80))
            .accessibilityLabel("Quotes activity")
            
            
            
            //MARK: BOOK - JOURNAL ACTIVITY
            Button {
                journalViewisShowingModal = true
            } label: {
                Image("book")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
            }
            .position(getPosition(percentX: 85, percentY: 80))

            .accessibilityLabel("Journal activity")

            //MARK: DOOR - LEAVE
            Button {
                leaveViewisShowingModal = true
            } label: {
                Image("door")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 300)
            }
            .position(getPosition(percentX: 85, percentY: 35))

                .accessibilityLabel("Journal activity")



            //MARK: STAR - GRATITUDE
            Button {
                gratitudeViewisShowingModal = true
            } label: {
                Image("star")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
            }
            .position(getPosition(percentX: 50, percentY: 65))

            .accessibilityLabel("Gratitude activity")
        }
        
        .sheet(isPresented: $breathingViewisShowingModal, content: {
            BreathingView(isPresented: self.$breathingViewisShowingModal)
        })
        
        .sheet(isPresented: $quoteViewisShowingModal, content: {
            QuoteView(isPresented: self.$quoteViewisShowingModal)
        })
        
        .sheet(isPresented: $journalViewisShowingModal, content: {
            JournalView(isPresented: self.$journalViewisShowingModal)
        })
        
        .sheet(isPresented: $gratitudeViewisShowingModal, content: {
            GratitudeView(isPresented: self.$gratitudeViewisShowingModal)
        })
        
        .sheet(isPresented: $stoicismViewShowingModal, content: {
            StoicismView(isPresented: self.$stoicismViewShowingModal)
        })
        
        .sheet(isPresented: $infoViewToggle, content: {
            InfoView()
        })
        
        .sheet(isPresented: $leaveViewisShowingModal, content: {
            LeaveView(isPresented: self.$leaveViewisShowingModal)
        })

        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)"))
                .previewDisplayName("iPad Pro (9.7-inch)")

            HomeView()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (10.5-inch)"))
                .previewDisplayName("iPad Pro (10.5-inch)")

            HomeView()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch) (1st generation)"))
                .previewDisplayName("iPad Pro (11-inch) (1st generation)")

            HomeView()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch) (2nd generation)"))
                .previewDisplayName("iPad Pro (11-inch) (2nd generation)")

            HomeView()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (1st generation)"))
                .previewDisplayName("iPad Pro (12.9-inch) (1st generation)")

            HomeView()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (2nd generation)"))
                .previewDisplayName("iPad Pro (12.9-inch) (2nd generation)")

            HomeView()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (3rd generation)"))
                .previewDisplayName("iPad Pro (12.9-inch) (3rd generation)")

            HomeView()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (4th generation)"))
                .previewDisplayName("iPad Pro (12.9-inch) (4th generation)")

            HomeView()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)"))
                .previewDisplayName("iPad Pro (12.9-inch) (5th generation)")

            HomeView()
                .previewDevice(PreviewDevice(rawValue: "iPad (8th generation)"))
                .previewDisplayName("iPad (8th generation)")

        }
    }
}




@ViewBuilder
func createBackgroundWithDesert (isDarkMode: Binding<Bool>) -> some View {
    ZStack {
        if isDarkMode.wrappedValue == false {
            Image("day_full_sky")
                .resizable()
                .accessibilityLabel("Day Sky")
                .ignoresSafeArea()
        } else {
            Image("night_full_sky")
                .resizable()
                .accessibilityLabel("Night Sky")
                .ignoresSafeArea()
        }
        
        Image("desert")
            .resizable()
            .accessibilityLabel("Desert")
            .ignoresSafeArea()

    }
}

func getPosition(percentX: CGFloat, percentY: CGFloat) -> CGPoint {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    let posX = (screenWidth * percentX) / 100
    let posY = (screenHeight * percentY) / 100
    
    return CGPoint(x: posX, y: posY)
}

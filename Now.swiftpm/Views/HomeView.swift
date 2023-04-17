//
//  SwiftUIView.swift
//  
//
//  Created by Ale on 13/04/23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var musicViewModel = SoundViewModel.shared
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @EnvironmentObject var userData: UserData

    
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
            }.position(x: 350, y: 300)
                .accessibilityLabel("Breathing activity")
            
            
            //MARK: COLUMN - QUOTES ACTIVITY
            Button {
                quoteViewisShowingModal = true
            } label: {
                Image("column")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }.position(x: 200, y: 600)
                .accessibilityLabel("Quotes activity")
            
            
            
            //MARK: BOOK - JOURNAL ACTIVITY
            Button {
                journalViewisShowingModal = true
            } label: {
                Image("book")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
            }.position(x: 800, y: 700)
                .accessibilityLabel("Journal activity")

            //MARK: DOOR - LEAVE
            Button {
                leaveViewisShowingModal = true
            } label: {
                Image("door")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 300)
            }.position(x: 900, y: 270)
                .accessibilityLabel("Journal activity")



            
            Button {
                gratitudeViewisShowingModal = true
            } label: {
                Rectangle().frame(width: 50, height: 50)
                    .foregroundColor(.white)
            }.position(x: 400, y: 600)
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
        
        .sheet(isPresented: $leaveViewisShowingModal, content: {
            LeaveView(isPresented: self.$leaveViewisShowingModal)
        })
        
        
        
        .sheet(isPresented: $infoViewToggle, content: {
            InfoView()
        })
        
        
        
    }
}

struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        HomeView()
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


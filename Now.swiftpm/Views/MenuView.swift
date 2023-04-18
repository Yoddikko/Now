import SwiftUI

struct MenuView: View {
    
    @State var infoViewToggle = false
    @State var stoicismViewShowingModal = false
    
    @ObservedObject var musicViewModel = SoundViewModel.shared
    @AppStorage("isDarkMode") private var isDarkMode = true
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var opacity: Double = 1.0
    
    var fontViewModel = FontViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                createBackground(isDarkMode: $isDarkMode)
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
                    Text("Now.")
                        .font(fontViewModel.fontGentiumPlusTitle)
                    
                    Spacer()
                    
                    NavigationLink {
                        IntroView()
                    } label: {
                        Text("Enter")
                            .font(fontViewModel.fontGentiumPlusTitle3)
                            .padding(.horizontal, 30)
                    }
                    .background(RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.orange.opacity(0.2))
                    )
                    
                    Spacer()
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(.hidden, for: .navigationBar)
                .sheet(isPresented: $infoViewToggle) {
                    InfoView()
                }
                createBlackOverlay(opacity: $opacity)
            }
        }.sheet(isPresented: $stoicismViewShowingModal, content: {
            StoicismView(isPresented: $stoicismViewShowingModal)
        })
        .navigationViewStyle(.stack)
        .onAppear {
            Persistence.shared.saveQuotesFromJSON(context: viewContext)
            musicViewModel.startBackgroundMusic()
        }
        .onChange(of: musicViewModel.musicToggle) { newState in
            if newState {
                musicViewModel.startBackgroundMusic()
            } else {
                musicViewModel.stopBackgroundMusic()
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

@ViewBuilder
func createBackground (isDarkMode: Binding<Bool>) -> some View {
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
}

@ViewBuilder
func createBlackOverlay(opacity: Binding<Double>) -> some View {
    ZStack {
        Color.black.opacity(opacity.wrappedValue).ignoresSafeArea()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(.easeIn(duration: 2)) {
                        opacity.wrappedValue = 0.0
                    }
                }
            }
            .allowsHitTesting(opacity.wrappedValue == 0.0)
    }
}

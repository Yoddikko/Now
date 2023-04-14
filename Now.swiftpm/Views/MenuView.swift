import SwiftUI

struct MenuView: View {
    
    @State var infoViewToggle = false
    @ObservedObject var musicViewModel = MusicViewModel.shared
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var fontViewModel = FontViewModel()
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button {
                        withAnimation {
                            musicViewModel.musicToggle.toggle()
                        }
                    } label: {
                        Image(systemName: "music.note")
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
                                    .padding(10)
                            } else {
                                Image(systemName: "moon")
                                    .padding(10)

                            }
                        }
                        .background(.regularMaterial)
                        .cornerRadius(10)
                    
                    Spacer()
                    Button {
                        withAnimation {
                            infoViewToggle.toggle()
                        }
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .padding(10)
                    }
                    .background(.regularMaterial)
                    .cornerRadius(10)
                }.padding()
                Text("Now.")
                    .font(fontViewModel.fontGentiumPlusTitle)
                Spacer()
                
                NavigationLink {
                    HomeView()
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
            .overlay{
                if infoViewToggle {
                    InfoView()
                }
            }
        }.navigationViewStyle(.stack)
            .onAppear {
                musicViewModel.startBackgroundMusic()
            }
            .onChange(of: musicViewModel.musicToggle) { newState in
                if newState {
                    musicViewModel.startBackgroundMusic()
                } else {
                    musicViewModel.stopBackgroundMusic()
                }
            }
        
    }
}

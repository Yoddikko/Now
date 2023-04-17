import SwiftUI

struct IntroView: View {
    @State var welcomeTextOpacity = 0.0
    @State var forgiveTextOpacity = 0.0
    @State var likeTextOpacity = 0.0
    @State var interactTextOpacity = 0.0
    @State var leaveTextOpacity = 0.0

    var body: some View {
        VStack (spacing: 25) {
            
            Spacer()
            Text("Welcome to my safe space.")
                .font(FontViewModel.shared.fontGentiumPlusTitle3)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .opacity(welcomeTextOpacity)
                .animation(.easeInOut(duration: 1.0))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        withAnimation {
                            self.welcomeTextOpacity = 1.0
                        }
                    }
                }
            
            
            Text("You'll have to forgive me if it's a little messy....")
                .font(FontViewModel.shared.fontGentiumPlusTitle3)
                .foregroundColor(.white)
                .opacity(forgiveTextOpacity)
                .multilineTextAlignment(.center)
                .animation(.easeInOut(duration: 1.0))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                        withAnimation {
                            self.forgiveTextOpacity = 1.0
                        }
                    }
                }
            
            
            Text("But I'm sure you'll like it.")
                .font(FontViewModel.shared.fontGentiumPlusTitle3)
                .foregroundColor(.white)
                .opacity(likeTextOpacity)
                .multilineTextAlignment(.center)
                .animation(.easeInOut(duration: 1.0))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 6.5) {
                        withAnimation {
                            self.likeTextOpacity = 1.0
                        }
                    }
                }
            
            
            Text("You can interact with my relics and enjoy your stay.")
                .font(FontViewModel.shared.fontGentiumPlusTitle3)
                .foregroundColor(.white)
                .opacity(interactTextOpacity)
                .multilineTextAlignment(.center)
                .animation(.easeInOut(duration: 1.0))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 8.5) {
                        withAnimation {
                            self.interactTextOpacity = 1.0
                        }
                    }
                }
            
            
            Text("When you are ready to leave you can walk through the door.")
                .font(FontViewModel.shared.fontGentiumPlusTitle3)
                .foregroundColor(.white)
                .opacity(leaveTextOpacity)
                .multilineTextAlignment(.center)
                .animation(.easeInOut(duration: 1.0))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 11.0) {
                        withAnimation {
                            self.leaveTextOpacity = 1.0
                        }
                    }
                }
            
            
            NavigationLink {
                HomeView()
            } label: {
                Text("Continue")
                    .font(FontViewModel.shared.fontGentiumPlusTitle3)
                    .padding(.horizontal, 30)
            }.opacity(leaveTextOpacity)
                .disabled(leaveTextOpacity == 1.0 ? false : true)
            .background(RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.orange.opacity(0.2))
            ).opacity(leaveTextOpacity)
                .navigationBarBackButtonHidden(true)

            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

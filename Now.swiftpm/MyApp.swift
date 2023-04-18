import SwiftUI

@main
struct MyApp: App {
    @StateObject private var persistence = Persistence.shared
    @StateObject private var userData = UserData()
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some Scene {
        WindowGroup {
        MenuView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .environment(\.managedObjectContext, persistence.container.viewContext)
                .environmentObject(userData)
        }
    }
}

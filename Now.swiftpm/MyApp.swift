import SwiftUI

@main
struct MyApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some Scene {
        WindowGroup {
            MenuView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}

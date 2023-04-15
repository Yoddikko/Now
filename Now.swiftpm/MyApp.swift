import SwiftUI

@main
struct MyApp: App {
    @StateObject private var persistence = Persistence.shared

//    let persistence = Persistence.shared.saveQuotesFromJSON(context: persistence.container.viewContext)
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some Scene {
        WindowGroup {
            MenuView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .environment(\.managedObjectContext, persistence.container.viewContext)
        }
    }
}

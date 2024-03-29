import SwiftUI

@main
struct MyApp: App {
    // Initialise ParseTree Model
    @StateObject private var parseTreeModel = ParseTreeViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ParseTreeViewModel())
        }
    }
}

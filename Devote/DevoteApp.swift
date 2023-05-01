//
//  DevoteApp.swift
//  Devote
//
//  Created by Jared Infantino on 2023-04-30.
//

import SwiftUI

@main
struct DevoteApp: App {
    let persistenceController = PersistenceController.shared
    
    @AppStorage("isDarkMode") var isDarkMode: Bool = false

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext) // managed object context is injected into the core data container
                .preferredColorScheme(isDarkMode ? .dark : .light) // this will now set the application appearance independatly from what the global toggle is
        }
    }
}

//
//  java_flash_cardsApp.swift
//  java-flash-cards
//
//  Created by Nischal Tripuraneni on 5/8/23.
//

import SwiftUI

@main
struct java_flash_cardsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

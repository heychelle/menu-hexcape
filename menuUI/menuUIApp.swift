//
//  menuUIApp.swift
//  menuUI
//
//  Created by Michelle Alexandra on 31/10/22.
//

import SwiftUI

@main
struct menuUIApp: App {
    @State var changeView = false

    var body: some Scene {
        WindowGroup {
            ContentView(changeView: $changeView)
//            hecateSoundView()
        }
    }
}

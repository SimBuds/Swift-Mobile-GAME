//
//  projectPrototypeApp.swift
//  projectPrototype
//
//  Created by Lukas, Bruno, Casey and Matthew on 2024-04-17.
//

import SwiftUI

@main
struct projectPrototypeApp: App {
    @StateObject var dm = WordleDataModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                StartView()
                    .environmentObject(dm)
            }
        }
    }
}

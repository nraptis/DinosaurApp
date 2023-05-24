//
//  DinosaurAppCustomNavApp.swift
//  DinosaurAppCustomNav
//
//  Created by Tiger Nixon on 4/10/23.
//

import SwiftUI

@main
struct DinosaurAppCustomNavApp: App {
    let rootViewModel = RootViewModel()
    var body: some Scene {
        WindowGroup {
            RootView(viewModel: rootViewModel)
        }
    }
}

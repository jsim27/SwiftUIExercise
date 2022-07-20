//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Jae-hoon Sim on 2022/07/19.
//

import SwiftUI

@main
struct MemorizeApp: App {

    let game = EmojiMemoryGame()

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}

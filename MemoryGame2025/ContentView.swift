//
//  ContentView.swift
//  MemoryGame2025
//
//  Created by IMD 224 on 2025-01-08.
//

import SwiftUI

struct ContentView: View {
    @State var array = ["circle.dashed",
                        "square.dashed",
                        "app.dashed",
                        "shield"]
    @State var index = UserDefaults.standard.value(forKey:"Index") as? Int ?? 0
    @State private var bonus = UserDefaults.standard.value(forKey:"BonusTile") as? Bool ?? false
    @State private var rowsCols = UserDefaults.standard.value(forKey:"RowsCols") as? Int ?? 2
    @State private var tiles = UserDefaults.standard.value(forKey:"Tiles") as? Int ?? 2
    @State var showSettings: Bool = false
    var body: some View {
        NavigationStack {
            VStack{
                if showSettings {
                    SettingsView(bonus: $bonus, rowsCols: $rowsCols, tiles: $tiles, array: $array, index: $index)
                } else {
                    GameView(name: $array[index], rowsCols: $rowsCols, numTreasures: $tiles)
                }
            }
            .toolbar {
                ToolbarItemGroup {
                    Button(action: {
                        showSettings = !showSettings
                    }, label: {
                        Image(systemName: showSettings ? "house" : "gear")
                    })
                    .accessibilityIdentifier("SettingsButton")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

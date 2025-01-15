//
//  ContentView.swift
//  MemoryGame2025
//
//  Created by IMD 224 on 2025-01-08.
//

import SwiftUI

struct ContentView: View {
    @State var array = ["square.and.arrow.up", "square.and.arrow.up.fill", "square.and.arrow.up.circle", "square.and.arrow.up.circle.fill"]
    @State var index = 1
    @State private var bonus = UserDefaults.standard.value(forKey:"BonusTile") as? Bool ?? false
    @State private var rows = UserDefaults.standard.value(forKey:"Rows") as? Int ?? 2
    @State private var cols = UserDefaults.standard.value(forKey:"Cols") as? Int ?? 2
    @State private var tiles = UserDefaults.standard.value(forKey:"Tiles") as? Int ?? 2
    @State var showSettings: Bool = false
    var body: some View {
        NavigationStack {
            VStack{
                if showSettings {
                    SettingsView(bonus: $bonus, rows: $rows, cols: $cols, tiles: $tiles, array: $array, index: $index)
                } else {
                    GameView(name: $array[index])
                }
            }
            .toolbar {
                ToolbarItemGroup {
                    Button(action: {
                        showSettings = !showSettings
                    }, label: {
                        if showSettings {
                            Image(systemName: "house")
                        } else {
                            Image(systemName: "gear")
                        }
                    })
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

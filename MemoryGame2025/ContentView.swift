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
    var body: some View {
        NavigationStack {
            ImagePickerView(array: $array, index: $index)
            VStack{
                HStack{
                    Text(String(rows))
                    Stepper("Rows",
                            value: Binding(get:
                                            { rows }, set:
                                            { newValue in
                        rows = newValue
                        UserDefaults.standard.set(rows, forKey:"Rows")}), in: 2...10)
                }
                HStack {
                    Text(String(cols))
                    Stepper("Columns", value: Binding(get:
                                                        { cols }, set:
                                                        { newValue in
                                    cols = newValue
                                    UserDefaults.standard.set(cols, forKey:"Cols")}), in: 2...10)
                }
                HStack{
                    Text(String(tiles))
                    Stepper("Tiles", value: Binding(get:
                                                        { tiles }, set:
                                                        { newValue in
                                    tiles = newValue
                                    UserDefaults.standard.set(tiles, forKey:"Tiles")}), in: 2...10)
                }
                Toggle("Bonus Tile", isOn: Binding(get: { bonus }, set: { newValue in
                    bonus = newValue
                    UserDefaults.standard.set(bonus, forKey: "BonusTile")
                }))
                    .toolbar {
                        ToolbarItemGroup {
                            Button(action: {
                                
                            }, label: {
                                Image(systemName: "gear")
                            })
                        }
                    }
            }
            .padding()
            }
        }
    }

#Preview {
    ContentView()
}

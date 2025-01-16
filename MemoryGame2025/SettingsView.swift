//
//  ContentView.swift
//  MemoryGame2025
//
//  Created by IMD 224 on 2025-01-08.
//

import SwiftUI

struct SettingsView: View {
    @Binding var bonus: Bool
    @Binding var rowsCols: Int
    @Binding var tiles: Int
    @Binding var array: [String]
    @Binding var index: Int
    var body: some View {
        ImagePickerView(array: $array, index: $index)
        VStack{
            HStack{
                Text(String(rowsCols))
                Stepper("Rows and Columns",
                        value: Binding(get:
                                        { rowsCols }, set:
                                        { newValue in
                    rowsCols = newValue
                    UserDefaults.standard.set(rowsCols, forKey:"RowsCols")}), in: 2...10)
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
        }.padding()
    }
}



//
//  ContentView.swift
//  MemoryGame2025
//
//  Created by IMD 224 on 2025-01-08.
//

import SwiftUI

/// Encapsulates the settings pertaining to the memory game.
/// Allows for setting the n x n size of the board,
/// the icon designating the scoring tiles,
/// the number of treasures that will populate the board
/// and whether the bonus tile is enabled. ]
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
                    .accessibilityIdentifier("NumberOfRowsAndCols")
                Stepper("Rows and Columns",
                        value: Binding(get:
                                        { rowsCols }, set:
                                        { newValue in
                    rowsCols = newValue
                    UserDefaults.standard.set(rowsCols, forKey:"RowsCols")}), in: 2...10)
                .accessibilityIdentifier("RowsColsStepper")
            }
            HStack{
                Text(String(tiles))
                    .accessibilityIdentifier("NumberOfTiles")
                Stepper("Tiles", value: Binding(get:
                                                    { tiles }, set:
                                                    { newValue in
                    tiles = newValue
                    UserDefaults.standard.set(tiles, forKey:"Tiles")}), in: 2...10)
                .accessibilityIdentifier("TileStepper")
            }
            Toggle("Bonus Tile", isOn: Binding(get: { bonus }, set: { newValue in
                bonus = newValue
                UserDefaults.standard.set(bonus, forKey: "BonusTile")
            }))
            .accessibilityIdentifier("BonusToggle")
        }.padding()
    }
}



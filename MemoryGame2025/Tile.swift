import Observation
//
//  Tile.swift
//  MemoryGame2025
//
//  Created by IMD 224 on 2025-02-07.
//

@Observable
class Tile: Identifiable {
    var contents: String = "xmark.circle"
    var isScoring: Bool = false
    var wasClicked: Bool = true
}

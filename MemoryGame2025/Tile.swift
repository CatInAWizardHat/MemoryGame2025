import Observation
//
//  Tile.swift
//  MemoryGame2025
//
//  Created by IMD 224 on 2025-02-07.
//


/// A data-only class comprised of
/// a string representing the icon to display it with
/// a Bool designating whether the tile is worth points and
/// a Bool designating whether the tile has been clicked or tapped by the user.
@Observable
class Tile: Identifiable {
    var contents: String = "xmark.circle"
    var isScoring: Bool = false
    var wasClicked: Bool = true
}

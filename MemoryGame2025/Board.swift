import Observation
//
//  Board.swift
//  MemoryGame2025
//
//  Created by IMD 224 on 2025-02-07.
//

@Observable
class Board {
    var size: Int
    var board: [[Tile]] = [[Tile]]()
    
    /// Board initializer, creates an n x n array of Tile objects
    /// - Parameter size: An integer representing the N: the number of rows and columns, defaults to 10
    init(size: Int = 10) {
        self.size = size
        for _ in 0..<self.size {
            var row = [Tile]()
            for _ in 0..<self.size {
                row.append(Tile())
            }
            board.append(row)
        }
    }
    
    /// Using a loop, sets N number of tiles to act as treasure tiles
    /// - Parameter numTreasures: An integer representing the number of treasure tiles to create
    /// - Parameter name: A string representing the symbol to denote a treasure tile
    func pickTreasures(numTreasures: Int, name: String) {
        var row: Int
        var col: Int
        for _ in 1...numTreasures {
            row = Int.random(in: 0..<self.size)
            col = Int.random(in: 0..<self.size)
            board[row][col].contents = name
            board[row][col].isScoring = true
        }
    }
    
    /// Subscript Operator for the Board class, can act as a setter or getter for the tile at the designated set of indices
    /// - Parameter row: An integer representing the first index
    /// - Parameter column: An integer representing the second index
    /// - Returns: An optional with the contents of the tile, or nil
    subscript(row: Int, column: Int) -> String? {
        get {
            if (row < 0) || (size <= row) || (column < 0) || (size <= column) {
                return nil
            }
            
            return board[row][column].contents
        }
        set {
            if (row < 0) || (size <= row) || (column < 0) || (size <= column) {
                return
            }
            
            board[row][column].contents = newValue!
        }
    }
}

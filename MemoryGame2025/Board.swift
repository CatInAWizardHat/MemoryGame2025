import Observation
//
//  Board.swift
//  MemoryGame2025
//
//  Created by IMD 224 on 2025-02-07.
//

/// A board to represent the internal logic of the memory game
/// composed of an Int representing N number of rows and columns
/// and a 2d-Array of Tile objects.
@Observable
class Board {
    var size: Int
    var board: [[Tile]] = [[Tile]]()
    
    /// Board initializer, creates an n x n array of Tile objects
    /// - Parameter size: An integer representing the N number of rows and columns, defaults to 10. Expectation is it will always be between 2 and 10.
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
    /// - Parameter numTreasures: An integer representing the number of treasure tiles to create. Expectation is it will always be between 2 and 10.
    /// - Parameter name: A string representing the symbol to denote a treasure tile. Can not be nil.
    func pickTreasures(numTreasures: Int, name: String) {
        var row: Int
        var col: Int
        var treasuresToPick: Int = 0
        while treasuresToPick != numTreasures {
            row = Int.random(in: 0..<self.size)
            col = Int.random(in: 0..<self.size)
            if(board[row][col].isScoring) {
                continue
            } else {
                board[row][col].contents = name
                board[row][col].isScoring = true
                treasuresToPick += 1
            }
        }
    }
    
    /// Subscript Operator for the Board class, can act as a setter or getter for the tile at the designated set of indices
    /// - Parameter row: An integer representing the first index. Limit: Between 0 and board.size. Can not be nil.
    /// - Parameter column: An integer representing the second index. Limit: Between 0 and board.size. Can not be nil.
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

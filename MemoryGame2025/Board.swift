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

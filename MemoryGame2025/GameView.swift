//
//  GameView.swift
//  MemoryGame2025
//
//  Created by IMD 224 on 2025-01-15.
//

import SwiftUI

/// The view encapsulating the memory game itself.
struct GameView: View {
    @Binding var name: String
    @Binding var rowsCols: Int
    @Binding var numTreasures: Int
    @State var timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    @State var board: Board = Board()
    @State var unrevealedTreasures: Int = 0
    @State var score: UInt = 0
    @State var clicks: UInt = 0
    var body: some View {
        ScrollView{
            VStack {
                #if !os(watchOS)
                HStack{
                    Text("Clicks: \(String(clicks))")
                        .accessibilityIdentifier("Game Clicks")
                    Spacer()
                    Text("Score: \(String(score))")
                        .accessibilityIdentifier("Game Score")
                    Spacer()
                    Text("Treasures: \(String(unrevealedTreasures))")
                        .accessibilityIdentifier("Treasures Left")
                }
                .padding()
                #endif
                ForEach(board.board, id: \.first!.id) { row in
                    HStack {
                        ForEach(row) { tile in
                            Button(action: {
                                clicks = tile.wasClicked ? clicks : clicks + 1
                                score = tile.isScoring && !tile.wasClicked ? score + 1 : score
                                unrevealedTreasures = tile.isScoring && !tile.wasClicked ? unrevealedTreasures - 1 : unrevealedTreasures
                                tile.wasClicked = true
                            }, label: {
#if os(watchOS)
                                Image(systemName: tile.wasClicked ? tile.contents : "questionmark.app")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .scaledToFit()
#else
                                Image(systemName: tile.wasClicked ? tile.contents : "questionmark.app")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 32, height: 32)
#endif
                            })
                        }
                    }
                    }
                VStack {
                    Text("Clicks: \(String(clicks))")
                        .accessibilityIdentifier("Game Clicks")
                        .scaledToFit()
                        .minimumScaleFactor(0.4)
                        .lineLimit(1)
                    Spacer()
                    Text("Score: \(String(score))")
                        .accessibilityIdentifier("Game Score")
                        .scaledToFit()
                        .minimumScaleFactor(0.4)
                        .lineLimit(1)
                    Spacer()
                    Text("Treasures: \(String(unrevealedTreasures))")
                        .accessibilityIdentifier("Treasures Left")
                        .scaledToFit()
                        .minimumScaleFactor(0.4)
                        .lineLimit(1)
                }
            }.onAppear {
                board = Board(size: rowsCols)
                board.pickTreasures(numTreasures: numTreasures, name: name)
            }
            .onReceive(timer) { _ in
                for (_, row) in board.board.enumerated() {
                    for tile in row {
                        tile.wasClicked = false
                        if tile.isScoring {
                            unrevealedTreasures += 1
                        }
                    }
                }
                timer.upstream.connect().cancel()
            }
        }
    }
}


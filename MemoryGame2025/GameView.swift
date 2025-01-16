//
//  GameView.swift
//  MemoryGame2025
//
//  Created by IMD 224 on 2025-01-15.
//

import SwiftUI

struct GameView: View {
    @Binding var name: String
    var body: some View {
        Image(systemName: name)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
    }
}


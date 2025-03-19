//
//  ImagePickerView.swift
//  MemoryGame2025
//
//  Created by IMD 224 on 2025-01-15.
//

import SwiftUI

/// Allows the user to set which icon will represent the scoring tiles for the memory game.
struct ImagePickerView: View {
    @Binding var array: [String]
    @Binding var index: Int
    var body: some View {
        HStack {
            Button(
                action:{
                    index = (index <= 0) ? 3 : index - 1
                    UserDefaults.standard.set(index, forKey:"Index")
                }) {
                    #if os(watchOS)
                    Image(systemName: "arrowtriangle.left")
                        .resizable()
                        .scaledToFit()
                        .accessibilityIdentifier("LeftArrow")
                    #else
                    Image(systemName: "arrowtriangle.left")
                        .resizable()
                        .frame(width: 75, height: 60)
                        .accessibilityIdentifier("LeftArrow")
                    #endif
                }
            Spacer()
            #if os(watchOS)
            Image(systemName: array[index])
                .resizable()
                .scaledToFit()
                .aspectRatio(0.75, contentMode: .fit)
                .accessibilityLabel(array[index])
                .accessibilityIdentifier("Images")
            #else
            Image(systemName: array[index])
                .resizable()
                .frame(width:100, height:100)
                .aspectRatio(0.75, contentMode: .fit)
                .accessibilityLabel(array[index])
                .accessibilityIdentifier("Images")
            #endif
            Spacer()
            Button(
                action:{
                    index = (index >= 3) ? 0 : index + 1
                    UserDefaults.standard.set(index, forKey:"Index")
                }) {
                    #if os(watchOS)
                    Image(systemName: "arrowtriangle.right")
                        .resizable()
                        .scaledToFit()
                        .accessibilityIdentifier("RightArrow")
                    #else
                    Image(systemName: "arrowtriangle.right")
                        .resizable()
                        .frame(width: 75, height: 60)
                        .accessibilityIdentifier("RightArrow")
                    #endif
                        
                }
        }
        .padding()
        .scaledToFit()
    }
}

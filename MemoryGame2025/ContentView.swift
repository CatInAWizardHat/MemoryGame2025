//
//  ContentView.swift
//  MemoryGame2025
//
//  Created by IMD 224 on 2025-01-08.
//

import SwiftUI

struct ContentView: View {
    @State var array = ["square.and.arrow.up", "square.and.arrow.up.fill", "square.and.arrow.up.circle", "square.and.arrow.up.circle.fill"]
    @State var index = 1
    var body: some View {
        HStack {
            Button(
                action:{
                    index = (index <= 0) ? 3 : index - 1
                }) {
                Image(systemName: "arrowtriangle.left")
                    .resizable()
                    .frame(width: 75, height: 60)
            }
            Spacer()
            Image(systemName: array[index])
                .resizable()
                .frame(width:100, height:100)
                .aspectRatio(0.75, contentMode: .fit)
            Spacer()
            Button(
                action:{
                    index = (index >= 3) ? 0 : index + 1
                }) {
                Image(systemName: "arrowtriangle.right")
                    .resizable()
                    .frame(width: 75, height: 60)
            }
        }
        .padding()
        	
    }
}

#Preview {
    ContentView()
}

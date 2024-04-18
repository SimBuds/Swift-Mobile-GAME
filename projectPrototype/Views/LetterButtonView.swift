//
//  LetterButtonView.swift
//  projectPrototype
//
//  Created by Lukas, Bruno, Casey and Matthew on 2024-04-17.
//

import SwiftUI

// A view for a letter button in the game
struct LetterButtonView: View {
    @EnvironmentObject var dm: WordleDataModel // Data model
    var letter: String // Letter for the button
    var body: some View {
        Button {
            dm.addToCurrentWord(letter) // Add letter to current word on button press
        }label: {
            Text(letter)
                .font(.system(size: 20))
                .frame(width: 35, height: 50)
                .background(dm.keyColors[letter])
                .foregroundColor(.primary)
        }
        .buttonStyle(.plain)
    }
}

struct LetterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LetterButtonView(letter: "L")
            .environmentObject(WordleDataModel())
    }
}

//
//  GuessView.swift
//  projectPrototype
//
//  Created by Lukas, Bruno, Casey and Matthew on 2024-04-17.
//

import SwiftUI

struct GuessView: View {
    @Binding var guess: Guess
    var body: some View {
        HStack(spacing: 3){
            // Loop through each guess
            ForEach(0...4, id: \.self) {index in
                // FlipView for each guess

                FlipView(isFlipped: $guess.cardFlipped[index]){
                    // Front of the card
                    Text(guess.guessLetters[index])
                        .foregroundColor(.primary)
                        .frame(minWidth:0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                        .background(Color.systemBackground)
                } back: {
                    // Back of the card
                    Text(guess.guessLetters[index])
                        .foregroundColor(.white)
                        .frame(minWidth:0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                        .background(guess.bgColors[index])
                }
                
                    .font(.system(size: 35, weight: .heavy))
                    .border(Color(.secondaryLabel))
            }
        }
    }
}

struct GuessBiew_Previews: PreviewProvider {
    static var previews: some View {
        GuessView(guess: .constant(Guess(index: 0)))
    }
}

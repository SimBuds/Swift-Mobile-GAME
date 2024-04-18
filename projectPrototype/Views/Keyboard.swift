//
//  Keyboard.swift
//  projectPrototype
//
//  Created by Lukas, Bruno, Casey and Matthew on 2024-04-17.
//

import SwiftUI

struct Keyboard: View {
    @EnvironmentObject var dm: WordleDataModel
    // Define keyboard rows
    var topRowArray = "QWERTYUIOP".map{ String($0)}
    var secondRowArray = "ASDFGHJKL".map{ String($0)}
    var thirdRowArray = "ZXCVBNM".map{ String($0)}
    var body: some View {
        VStack {
            // Top row of keyboard
            HStack(spacing: 2) {
                ForEach(topRowArray, id: \.self) {
                    letter in LetterButtonView(letter:letter)
                }
                .disabled(dm.disabledKeys)
                .opacity(dm.disabledKeys ? 0.6 : 1)
            }
            // Second row of keyboard
            HStack(spacing: 2) {
                ForEach(secondRowArray, id: \.self) {
                    letter in LetterButtonView(letter:letter)
                }
                .disabled(dm.disabledKeys)
                .opacity(dm.disabledKeys ? 0.6 : 1)
            }
            // Third row of keyboard with special buttons
            HStack(spacing: 2) {
                // Enter button
                Button {
                    dm.enterWord()
                }label: {
                    Text("Enter")
                }
                .font(.system(size: 20))
                .frame(width: 60, height: 50)
                .foregroundColor(.primary)
                .background(Color.unused)
                .disabled(dm.currentWord.count < 5 || !dm.inPlay)
                .opacity((dm.currentWord.count < 5 || !dm.inPlay) ? 0.6 : 1)
                // Letters in third row
                ForEach(thirdRowArray, id: \.self) {
                    letter in LetterButtonView(letter: letter)
                }
                .disabled(dm.disabledKeys)
                .opacity(dm.disabledKeys ? 0.6 : 1)
                // Delete button
                Button {
                    dm.removeLetterFromCurrentWord()
                } label: {
                    Image(systemName: "delete.backward.fill")
                        .font(.system(size:20, weight: .heavy))
                        .frame(width: 40, height: 50)
                        .foregroundColor(.primary)
                        .background(Color.unused)
                }
                .disabled(!dm.inPlay || dm.currentWord.count == 0)
                .opacity((!dm.inPlay || dm.currentWord.count == 0) ? 0.6 : 1)
            }
        }
    }
}

struct Keyboard_Previews: PreviewProvider {
    static var previews: some View {
        Keyboard()
            .environmentObject(WordleDataModel())
            .scaleEffect(Global.keyboardScale)
    }
}

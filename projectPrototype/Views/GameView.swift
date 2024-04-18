//
//  GameView.swift
//  projectPrototype
//
//  Created by Lukas, Bruno, Casey and Matthew on 2024-04-17.
//

import SwiftUI

// Main game view
struct GameView: View {
    @EnvironmentObject var dm: WordleDataModel
    
    var body: some View {
        VStack{
            Spacer()
            VStack(spacing: 3) {
                //loop through each guess
                ForEach(0...5, id: \.self) { index in
                    GuessView(guess: $dm.guesses[index])
                        .modifier(Shake(animatableData: CGFloat(dm.incorrectAttempts[index])))
                }
            }
            .frame(width: Global.boardWidth, height: 6 * Global.boardWidth / 5)
            Spacer()
            //keyboard view
            Keyboard()
                .scaleEffect(Global.keyboardScale)
                .padding(.top)
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            //toolbar item for game title
            ToolbarItem(placement: .principal) {
                Text("WORD GAME")
                    .font(.largeTitle)
                    .fontWeight (.heavy)
                    .foregroundColor (.primary)
            }

            //navigation link to leaderboard view
        }
        NavigationLink(destination: LeaderboardView().environmentObject(dm), isActive: $dm.gameOver) {
            EmptyView()
        }
            
        }
        
    }


#Preview {
    GameView()
        .environmentObject(WordleDataModel())
}

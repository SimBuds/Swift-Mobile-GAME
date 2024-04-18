//
//  LeaderboardView.swift
//  projectPrototype
//
//  Created by Lukas, Bruno, Casey and Matthew on 2024-04-17.
//

import SwiftUI

// This view is responsible for displaying the leaderboard


struct LeaderboardView: View {
    @EnvironmentObject var dm: WordleDataModel     // dm is an instance of WordleDataModel

    // The body property contains the view hierarchy to be displayed

    var body: some View {
        // VStack stacks its children vertically

        VStack {
            // Display the title of the leaderboard

            Text("Leaderboard")
                .font(.largeTitle) // Set the font size to large
                .padding()// Add padding around the text

            HStack {
                           VStack(alignment: .leading) {
                               Text("Name")
                                   .font(.headline)
                                   .fontWeight(.bold)
                                   .padding(.bottom, 5)
                               Text(dm.nickname)
                           }
                           Spacer()
                           VStack(alignment: .leading) {
                               Text("Guesses")
                                   .font(.headline)
                                   .fontWeight(.bold)
                                   .padding(.bottom, 5)
                               Text("\(dm.totalGuesses)")
                           }
                       }
                       .padding()
                   }
               }
           }


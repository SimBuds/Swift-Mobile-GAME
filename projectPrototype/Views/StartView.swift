//
//  StartView.swift
//  projectPrototype
//
//  Created by Lukas Canji on 2024-04-17.
//

//
//  StartView.swift
//  projectPrototype
//
//  Created by Lukas, Bruno, Casey and Matthew on 2024-04-17.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var dm: WordleDataModel

    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Wordle Game") //title
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 50)
                
                TextField("Enter Nickname", text: $dm.nickname) //user input
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .frame(width: 300, height: 50)
                    .font(.title2)

                NavigationLink(destination: GameView().environmentObject(dm)) { //navigate to gameview after hitting play button
                    Text("Play")
                        .font(.title)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(dm.nickname.isEmpty)
                .opacity(dm.nickname.isEmpty ? 0.5 : 1)
            }
            .padding()
        }
    }
}


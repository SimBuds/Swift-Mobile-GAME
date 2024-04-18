//
//  Color+Extension.swift
//  projectPrototype
//
//  Created by Lukas Canji on 2024-03-23.
//

import SwiftUI

extension Color {
    static var Wrong: Color {
        Color(UIColor(named: "wrong")!)
    }
    static var Misplaced: Color {
        Color(UIColor(named: "misplaced")!)
    }
    static var Correct: Color {
        Color(UIColor(named: "correct")!)
    }
    static var Unused: Color {
        Color(UIColor(named: "unused")!)
    }
    static var systemBackground: Color {
        Color(.systemBackground)
    }
}

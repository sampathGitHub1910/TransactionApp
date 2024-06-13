//
//  UserPreferences.swift
//  Task
//
//  Created by RPS on 13/06/24.
//


import SwiftUI
import Combine

enum Theme: String, CaseIterable, Identifiable {
    case light, dark

    var id: String { self.rawValue }

    var colorScheme: ColorScheme {
        switch self {
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}

enum FontSize: String, CaseIterable, Identifiable {
    case small, medium, large

    var id: String { self.rawValue }

    var size: CGFloat {
        switch self {
        case .small:
            return 14
        case .medium:
            return 18
        case .large:
            return 22
        }
    }
}

class UserPreferences: ObservableObject {
    @Published var theme: Theme = .light
    @Published var fontSize: FontSize = .medium
}

//
//  PreferncesView.swift
//  Task
//
//  Created by RPS on 13/06/24.
//


import SwiftUI

struct PreferencesView: View {
    @ObservedObject var preferences: UserPreferences

    var body: some View {
        Form {
            Section(header: Text("Theme")) {
                Picker("Theme", selection: $preferences.theme) {
                    ForEach(Theme.allCases) { theme in
                        Text(theme.rawValue.capitalized).tag(theme)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }

            Section(header: Text("Font Size")) {
                Picker("Font Size", selection: $preferences.fontSize) {
                    ForEach(FontSize.allCases) { fontSize in
                        Text(fontSize.rawValue.capitalized).tag(fontSize)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
        }
        .navigationBarTitle("Preferences")
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView(preferences: UserPreferences())
    }
}

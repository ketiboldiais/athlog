//
//  athlogApp.swift
//  athlog
//
//  Created by Ketib Oldiais on 10/7/21.
//

import SwiftUI

@main
struct athlogApp: App {
		let viewModel = WorkoutViewModel()
    var body: some Scene {
        WindowGroup {
					ContentView(viewModel: viewModel)
        }
    }
}

//
//  ContentView.swift
//  athlog
//
//  Created by Ketib Oldiais on 10/7/21.
//

import SwiftUI

struct ContentView: View {
	var viewModel: WorkoutViewModel // hook up ViewModel
    var body: some View {
			TabView {
				workoutView()
					.tabItem { Text("Workout")
					.font(.largeTitle)
					.fontWeight(.bold)}
				progressView()
					.tabItem { Text("History")
					.font(.largeTitle)
					.fontWeight(.bold)}
				exerciseLibraryView()
					.tabItem { Text("Exercises")
					.font(.largeTitle)
					.fontWeight(.bold)}
			}
			.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
			let viewModel = WorkoutViewModel()
			ContentView(viewModel: viewModel)
    }
}

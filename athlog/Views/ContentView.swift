//
//  ContentView.swift
//  athlog
//
//  Created by Ketib Oldiais on 10/7/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
			TabView {
				workoutView()
					.tabItem { Text("Workout")
					.font(.largeTitle)
					.fontWeight(.bold)}
				historyView()
					.tabItem { Text("History")
					.font(.largeTitle)
					.fontWeight(.bold)}
				exercisesView()
					.tabItem { Text("Exercises")
					.font(.largeTitle)
					.fontWeight(.bold)}
			}
			.padding()

//			.tabViewStyle(PageTabViewStyle())
//			.indexViewStyle(
//				PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

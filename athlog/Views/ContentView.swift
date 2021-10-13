//
//  ContentView.swift
//  athlog
//
//  Created by Ketib Oldiais on 10/7/21.
//

import SwiftUI
import Foundation
import UIKit
import Combine

class WSet: Identifiable, Equatable, ObservableObject {
	static func == (lhs: WSet, rhs: WSet) -> Bool {
		return lhs.id == rhs.id
	}
	var id = UUID()
	@Published var weight: Double
	@Published var reps: Int
	
	init(weight: Double, reps: Int) {
		self.weight = weight
		self.reps = reps
	}
}

class Exercise: ObservableObject {
	@Published var name: String
	@Published var sets = [WSet]()
	@Published var setCount = 1
	
	init(name: String = "Exercise", sets: [WSet] = []) {
		self.name = name
		self.sets = sets
	}
	
	func addSet(_ newSet: WSet = WSet(weight: 0.0, reps: 0)) {
		self.sets.append(newSet)
		self.setCount += 1
	}
}


class Workout: ObservableObject {
	@Published var exerciseList = [Exercise]()
	
	init(_ exerciseList: [Exercise] = [Exercise(name: "Exercise", sets: [WSet(weight: 0.0, reps: 0)])]) {
		self.exerciseList = exerciseList
	}
	
	func addExercise(_ newExercise: Exercise = Exercise(name: "Exercise", sets: [WSet(weight: 0, reps: 0)])) {
		self.exerciseList.append(newExercise)
	}
}


struct ContentView: View {
	@StateObject var ViewModel: Workout = Workout()
	var body: some View {
		TabView {
			Text("Exercise Library")
				.tabItem { Text("Exercise Library") }
			WorkoutView(ViewModel: ViewModel)
				.tabItem { Text("Workout") }
			Text("Exercise Library")
				.tabItem { Text("Stats") }
		}
		.padding()
	}
}

struct WorkoutView: View {
	@StateObject var ViewModel: Workout
	var body: some View {
		List {
			ForEach (ViewModel.exerciseList.indices, id: \.self) { i in
				TableLabelView(exercise: ViewModel.exerciseList[i])
				TableRowView(exercise: ViewModel.exerciseList[i])
			}
			Button(
				action: { ViewModel.addExercise()})
				{ Text("Add Exercise") }
		}
	}
}


struct TableLabelView: View {
	@StateObject var exercise: Exercise
	var body: some View {
		Text("\(exercise.name)")
		HStack {
			Text("Set")
			Spacer()
			Text("Weight")
			Spacer()
			Text("Reps")
		}
	}
}

struct TableRowView: View {
	@StateObject var exercise: Exercise
	var body: some View {
		ForEach(exercise.sets) { exerciseSet in
			SetRow(exercise: exercise, exerciseSet: exerciseSet )
		}
		VStack {
			Button(action: {
				exercise.addSet()
			}) {
				Text("Add Set")
			}
		}
	}
}

struct SetRow: View {
	@State var exercise: Exercise
	@StateObject var exerciseSet: WSet
	var body: some View {
		HStack {
			VStack {
				Text("\(exercise.setCount)")
					.padding()
			}
			Spacer()
			WeightFieldView(weight: exerciseSet.weight)
			RepsFieldView(reps: exerciseSet.reps)
		}
	}
}


struct WeightFieldView: View {
	@State var weight: Double
	var body: some View {
		VStack {
			TextField("Weight", text: Binding(
				get: { String(weight) },
				set: { weight = Double($0) ?? 0 }
			))
		}
	}
}

struct RepsFieldView: View {
	@State var reps: Int
	var body: some View {
		VStack {
			TextField("Weight", text: Binding(
				get: { String(reps) },
				set: { reps = Int($0) ?? 0 }
			))
		}
	}
}



















struct ContentView_Previews: PreviewProvider {
		static var previews: some View {
				ContentView()
	}
}

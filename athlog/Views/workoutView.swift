//
//  workoutView.swift
//  workoutView
//
//  Created by Ketib Oldiais on 10/7/21.
//

import SwiftUI
import Combine

struct workoutView: View {

		var body: some View {
			List {
				exerciseSectionView()
				addExerciseView()
			}
		}
}


struct addSetRowView: View {
	var body: some View {
		VStack {
			Button(action: {
				
			}) {
					Text("Add Set")
			}
		}
	}
}

struct addExerciseView: View {
	var body: some View {
		VStack {
			Button(action: {
			}) {
					Text("Add Exercise")
			}
		}
	}
}

struct exerciseSectionView: View {
	@State static var workout = Workout(startWorkout: true)
	var exercises = workout.lifts.count
	var body: some View {
		ForEach(0..<exercises) {index in
				movementView()
		}
	}
}



struct movementView: View {
	var body: some View {
		VStack {
			exerciseColumnView()
			columnHeaderView()
			setRow()
			addSetRowView()
		}
	}
}

struct columnHeaderView: View {
	var body: some View {
		HStack {
			Text("Set")
				.padding(5)
			Spacer()
			Text("Weight")
				.padding(5)
			Spacer()
			Text("Reps")
				.padding(5)
			Spacer()
			Text("Done")
				.padding(5)
		}
		.font(.caption)
	}
}

struct setRow: View {
	var body: some View {
		HStack {
			setsColumnView()
			weightColumnView()
			repsColumnView()
			completeColumnView()
		}
	}
}

struct exerciseColumnView: View {
	var body: some View {
		VStack {
			Text("Squat")
				.font(.caption)
				.padding(2)
			}
		}
	}

struct weightColumnView: View {
	var body: some View {
		VStack {
			weightInputView()
		}
	}
}

struct repsColumnView: View {
	var body: some View {
		VStack {
			repsInputView()
		}
	}
}

struct setsColumnView: View {
	var body: some View {
		VStack {
			Text("1")
				.font(.caption)
				.padding()

		}
	}
}

struct completeColumnView: View {
	@State private var checked = true
	var body: some View {
		VStack {
			CheckBoxView(checked: $checked)
		}
	}
}


struct weightInputView: View {
		@State private var weight = ""

		var body: some View {
			TextField("", text: $weight)
				.multilineTextAlignment(.center)
				.textFieldStyle(.roundedBorder)
				.keyboardType(.decimalPad)
						.onReceive(Just(weight)) { newValue in
								let filtered = newValue.filter { "0123456789.".contains($0) }
								if filtered != newValue {
										self.weight = filtered
								}
				}
		}
}

struct repsInputView: View {
		@State private var reps = ""

		var body: some View {
			TextField("", text: $reps)
				.multilineTextAlignment(.center)
				.textFieldStyle(.roundedBorder)
				.keyboardType(.decimalPad)
						.onReceive(Just(reps)) { newValue in
								let filtered = newValue.filter { "0123456789.".contains($0) }
								if filtered != newValue {
										self.reps = filtered
								}
				}
		}
}

struct CheckBoxView: View {
		@Binding var checked: Bool

		var body: some View {
				Image(systemName: checked ? "checkmark.square.fill" : "square")
						.foregroundColor(checked ? Color(UIColor.systemBlue) : Color.secondary)
						.onTapGesture {
								self.checked.toggle()
						}
						.padding()
		}
}

struct workoutView_Previews: PreviewProvider {
		static var previews: some View {
			workoutView()
		}
}


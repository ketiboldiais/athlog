//  exercise.swift
//  exercise
//  Created by Ketib Oldiais on 10/7/21.




import Foundation

struct Workout {
	// data: list of exercises inside a current workout session; this is what goes into the current workout
	var exerciseList: [Workout.Exercise] = [
		Workout.Exercise(name: "Bench", weight: 0.0, reps: 0, sets: []),
		Workout.Exercise(name: "Squat", weight: 0.0, reps: 0, sets: []),
		Workout.Exercise(name: "Deadlift", weight: 0.0, reps: 0, sets: [])
	]
	
	init(startWorkout: Bool) {
		// starts a workout -- initializes the ViewModel var model
		exerciseList = Array<Exercise>()
	}
	
	mutating func addExercise(exerciseName: String, exerciseWeight: Double, exerciseReps: Int, exerciseSets: [Int]) {
	// function: user adds an exercise
		exerciseList.append(Exercise(name: exerciseName, weight: exerciseWeight, reps: exerciseReps, sets: exerciseSets))
	}
	
	var lifts = [
		Workout.Exercise(
			name: "Back Squat",
			weight: 0.0,
			reps: 0
		)
	]
	
	struct Exercise: Identifiable, Hashable {
		let id = UUID()
		var name: String
		var weight: Double
		var reps: Int
		var sets: [Int] = []
		var numSets: Int {
			get {
				let numSets = sets.count
				return numSets
			}
		}
		
		mutating func addSet() {
			for _ in self.sets {self.sets.append(self.sets[numSets] + 1)}
		}
		mutating func removeSet() {
			for _ in self.sets {self.sets.removeLast()}
		}
	}
}





extension Workout {
	static var exerciseLibrary = [
		Workout.Exercise(
			name: "Back Squat",
			weight: 0.0,
			reps: 0
		),
		Workout.Exercise(
			name: "Bench Press",
			weight: 0.0,
			reps: 0
		),
		Workout.Exercise(
			name: "Deadlift",
			weight: 0.0,
			reps: 0
		)
	]
}

//  exercise.swift
//  exercise
//  Created by Ketib Oldiais on 10/7/21.




import Foundation

struct Workout {
	// data: list of exercises inside a current workout session; this is what goes into the current workout
	var exerciseList: Array<Exercise>
	
	init(startWorkout: Bool) {
		// starts a workout -- initializes the ViewModel var model
		exerciseList = Array<Exercise>()
	}
	
	mutating func addExercise(exerciseName: String, exerciseWeight: Double, exerciseReps: Int, exerciseSets: [Int]) {
	// function: user adds an exercise
		exerciseList.append(Exercise(name: exerciseName, weight: exerciseWeight, reps: exerciseReps, sets: exerciseSets))
	}
	
	struct Exercise {
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


//extension Workout.Exercise {
//	static var exercises = [
//		Workout.Exercise(
//			name: "Squat"
//		),
//		Workout.Exercise(
//			name: "Bench Press"
//		),
//		Workout.Exercise(
//			name: "Deadlift"
//		)
//	]
//}

//
//  exercise.swift
//  exercise
//
//  Created by Ketib Oldiais on 10/7/21.
//

import Foundation

class Exercise {
	let exerciseName: String
	init(exerciseName: String) {
		self.exerciseName = exerciseName
	}
}

extension Exercise {
	static let exercises = [
		Exercise(
			exerciseName: "Squat"
		),
		Exercise(
			exerciseName: "Bench Press"
		),
		Exercise(
			exerciseName: "Deadlift"
		)
	]
}

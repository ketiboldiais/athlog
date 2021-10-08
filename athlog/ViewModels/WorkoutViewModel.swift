//  athlogViewModel.swift
//  athlogViewModel
//  Created by Ketib Oldiais on 10/8/21.

/*
 * WorkoutSession is a view model
 * 	private(set) var model: Only WorkoutSession can change the code inside the view model. Others, however, can see.
 */

import SwiftUI



class WorkoutViewModel {
	private(set) var model: Workout = Workout(startWorkout: true)
	
	static var exercises: Array<Workout.Exercise> {
		return Workout(startWorkout: true).exerciseList
	}
	
	static var exerciseLibary: Array<Workout.Exercise> {
		return Workout.exerciseLibrary
	}
	
	// initializers
	func addExercise(name: String, weight: Double, reps: Int, sets: [Int]) {
		return model.addExercise(exerciseName: name, exerciseWeight: weight, exerciseReps: reps, exerciseSets: sets)
	}
}


//
//  historyView.swift
//  historyView
//
//  Created by Ketib Oldiais on 10/7/21.
//

import SwiftUI

struct exerciseLibraryView: View {
    var body: some View {
			ScrollView {
				UpperBodyExercisesView()
				LowerBodyExercisesView()
			}
    }
}

struct UpperBodyExercisesView: View {
		var body: some View {
			VStack {
				Text("Bench Press")
				Text("Overhead Press")
			}
		}
}

struct LowerBodyExercisesView: View {
		var body: some View {
			VStack {
				Text("Back Squat")
				Text("Front Squat")
			}
		}
}




struct exerciseLibraryView_Previews: PreviewProvider {
    static var previews: some View {
        exerciseLibraryView()
    }
}

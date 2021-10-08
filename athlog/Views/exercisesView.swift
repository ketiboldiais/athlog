//
//  exercisesView.swift
//  exercisesView
//
//  Created by Ketib Oldiais on 10/7/21.
//

import SwiftUI
import Combine

struct exercisesView: View {
    var body: some View {
			List {
				movementView()
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
			Text(Exercise.exercises[0].exerciseName)
				.font(.caption)
				.padding(2)
		}
	}
}

struct weightColumnView: View {
	var body: some View {
		VStack {
			inputView()
		}
	}
}

struct repsColumnView: View {
	var body: some View {
		VStack {
			inputView()

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

struct inputView: View {
		@State private var val = ""

		var body: some View {
			TextField("", text: $val)
				.multilineTextAlignment(.center)
				.textFieldStyle(.roundedBorder)
				.keyboardType(.decimalPad)
						.onReceive(Just(val)) { newValue in
								let filtered = newValue.filter { "0123456789.".contains($0) }
								if filtered != newValue {
										self.val = filtered
								}
				}
		}
}

 

struct exercisesView_Previews: PreviewProvider {
    static var previews: some View {
        exercisesView()
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

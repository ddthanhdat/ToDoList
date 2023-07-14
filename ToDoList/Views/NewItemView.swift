//
//  NewItemView.swift
//  ToDoList
//
//  Created by thanhdat on 12/07/2023.
//

import SwiftUI

struct NewItemView: View {
	@StateObject var viewModel = NewItemViewViewModel()
	@Binding var showingNewItemView: Bool
	
	var body: some View {
		VStack {
			Text("New Item")
				.font(.system(size: 32))
				.bold()
				.padding(.top, 20)
			
			Form {
				// Title
				TextField("Title", text: $viewModel.title)
					.textFieldStyle(DefaultTextFieldStyle())
				
				// Due date
				DatePicker("dueDate", selection: $viewModel.dueDate)
					.datePickerStyle(GraphicalDatePickerStyle())
				//Button
				TLButton(title: "Save", background: .pink) {
					if viewModel.canSave {
						viewModel.save()
						showingNewItemView = false
					} else {
						viewModel.showAlert = true
					}
					
				}.padding()
			}
		}
		.alert(isPresented: $viewModel.showAlert) {
			Alert(title: Text("Error"), message: Text("Please fill in all fields"))
		}
	}
}

struct NewItemView_Previews: PreviewProvider {
	static var previews: some View {
		NewItemView(showingNewItemView: Binding(get: {
			return true
		}, set: { _ in
			
		}))
	}
}

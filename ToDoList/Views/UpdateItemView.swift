//
//  UpdateItemView.swift
//  ToDoList
//
//  Created by thanhdat on 13/07/2023.
//

import SwiftUI


struct UpdateItemView: View {
	@StateObject var viewModel: UpdateItemViewViewModel
	@Binding var showingNewItemView: Bool
//	var item: ToDoListItemModel
	
	var body: some View {
		VStack {
			Text("Update Item")
				.font(.system(size: 32))
				.bold()
				.padding(.top, 50)
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

//struct UpdateItemView_Previews: PreviewProvider {
//	static var previews: some View {
//		UpdateItemView(showingNewItemView: Binding(get: {
//			return true
//		}, set: { _ in
//			
//		}), item: ToDoListItemModel.NOOB
//		)
//	}
//}
